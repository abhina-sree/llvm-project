"""
Test lldb-dap setBreakpoints request in assembly source references.
"""


from lldbsuite.test.decorators import *
from dap_server import Source
import lldbdap_testcase


class TestDAP_setBreakpointsAssembly(lldbdap_testcase.DAPTestCaseBase):
    # When using PDB, we need to have debug information to break on assembly_func,
    # but this test relies on us not having debug information for that function.
    @skipIfWindows
    def test_can_break_in_source_references(self):
        """Tests hitting assembly source breakpoints"""
        program = self.getBuildArtifact("a.out")
        self.build_and_launch(program)

        assmebly_func_breakpoints = self.set_function_breakpoints(["assembly_func"])
        self.continue_to_breakpoints(assmebly_func_breakpoints)

        assembly_func_frame = self.get_stackFrames()[0]
        self.assertIn(
            "sourceReference",
            assembly_func_frame.get("source"),
            "Expected assembly source frame",
        )

        line = assembly_func_frame["line"]

        # Set an assembly breakpoint in the next line and check that it's hit
        source_reference = assembly_func_frame["source"]["sourceReference"]
        assembly_breakpoint_ids = self.set_source_breakpoints_assembly(
            source_reference, [line + 1]
        )
        self.continue_to_breakpoints(assembly_breakpoint_ids)

        # Continue again and verify it hits in the next function call
        self.continue_to_breakpoints(assmebly_func_breakpoints)
        self.continue_to_breakpoints(assembly_breakpoint_ids)

        # Clear the breakpoint and then check that the assembly breakpoint does not hit next time
        self.set_source_breakpoints_assembly(source_reference, [])
        self.continue_to_breakpoints(assmebly_func_breakpoints)
        self.continue_to_exit()

    def test_break_on_invalid_source_reference(self):
        """Tests hitting assembly source breakpoints"""
        program = self.getBuildArtifact("a.out")
        self.build_and_launch(program)

        # Verify that setting a breakpoint on an invalid source reference fails
        response = self.dap_server.request_setBreakpoints(
            Source(source_reference=-1), [1]
        )
        self.assertIsNotNone(response)
        breakpoints = response["body"]["breakpoints"]
        self.assertEqual(len(breakpoints), 1)
        breakpoint = breakpoints[0]
        self.assertFalse(
            breakpoint["verified"], "Expected breakpoint to not be verified"
        )
        self.assertIn("message", breakpoint, "Expected message to be present")
        self.assertEqual(
            breakpoint["message"],
            "Invalid sourceReference.",
        )

        # Verify that setting a breakpoint on a source reference that is not created fails
        response = self.dap_server.request_setBreakpoints(
            Source(source_reference=200), [1]
        )
        self.assertIsNotNone(response)
        breakpoints = response["body"]["breakpoints"]
        self.assertEqual(len(breakpoints), 1)
        break_point = breakpoints[0]
        self.assertFalse(
            break_point["verified"], "Expected breakpoint to not be verified"
        )
        self.assertIn("message", break_point, "Expected message to be present")
        self.assertEqual(
            break_point["message"],
            "Invalid sourceReference.",
        )
