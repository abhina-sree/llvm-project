; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 5
; RUN: opt -p loop-vectorize -force-vector-width=4 -force-vector-interleave=2 -S %s | FileCheck %s

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Test case for https://github.com/llvm/llvm-project/issues/111042.
define void @replicate_udiv_with_only_first_lane_used(i32 %x, ptr %dst, i64 %d) {
; CHECK-LABEL: define void @replicate_udiv_with_only_first_lane_used(
; CHECK-SAME: i32 [[X:%.*]], ptr [[DST:%.*]], i64 [[D:%.*]]) {
; CHECK-NEXT:  [[ENTRY:.*]]:
; CHECK-NEXT:    [[C:%.*]] = icmp eq i32 [[X]], 10
; CHECK-NEXT:    br i1 false, label %[[SCALAR_PH:.*]], label %[[VECTOR_PH:.*]]
; CHECK:       [[VECTOR_PH]]:
; CHECK-NEXT:    br label %[[VECTOR_BODY:.*]]
; CHECK:       [[VECTOR_BODY]]:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i64 [ 0, %[[VECTOR_PH]] ], [ [[INDEX_NEXT:%.*]], %[[PRED_UDIV_CONTINUE14:.*]] ]
; CHECK-NEXT:    br i1 false, label %[[PRED_UDIV_IF:.*]], label %[[PRED_UDIV_CONTINUE:.*]]
; CHECK:       [[PRED_UDIV_IF]]:
; CHECK-NEXT:    [[TMP0:%.*]] = udiv i64 99, [[D]]
; CHECK-NEXT:    br label %[[PRED_UDIV_CONTINUE]]
; CHECK:       [[PRED_UDIV_CONTINUE]]:
; CHECK-NEXT:    [[TMP1:%.*]] = phi i64 [ poison, %[[VECTOR_BODY]] ], [ [[TMP0]], %[[PRED_UDIV_IF]] ]
; CHECK-NEXT:    br i1 false, label %[[PRED_UDIV_IF1:.*]], label %[[PRED_UDIV_CONTINUE2:.*]]
; CHECK:       [[PRED_UDIV_IF1]]:
; CHECK-NEXT:    [[TMP2:%.*]] = udiv i64 99, [[D]]
; CHECK-NEXT:    br label %[[PRED_UDIV_CONTINUE2]]
; CHECK:       [[PRED_UDIV_CONTINUE2]]:
; CHECK-NEXT:    br i1 false, label %[[PRED_UDIV_IF3:.*]], label %[[PRED_UDIV_CONTINUE4:.*]]
; CHECK:       [[PRED_UDIV_IF3]]:
; CHECK-NEXT:    [[TMP3:%.*]] = udiv i64 99, [[D]]
; CHECK-NEXT:    br label %[[PRED_UDIV_CONTINUE4]]
; CHECK:       [[PRED_UDIV_CONTINUE4]]:
; CHECK-NEXT:    br i1 false, label %[[PRED_UDIV_IF5:.*]], label %[[PRED_UDIV_CONTINUE6:.*]]
; CHECK:       [[PRED_UDIV_IF5]]:
; CHECK-NEXT:    [[TMP4:%.*]] = udiv i64 99, [[D]]
; CHECK-NEXT:    br label %[[PRED_UDIV_CONTINUE6]]
; CHECK:       [[PRED_UDIV_CONTINUE6]]:
; CHECK-NEXT:    br i1 false, label %[[PRED_UDIV_IF7:.*]], label %[[PRED_UDIV_CONTINUE8:.*]]
; CHECK:       [[PRED_UDIV_IF7]]:
; CHECK-NEXT:    [[TMP5:%.*]] = udiv i64 99, [[D]]
; CHECK-NEXT:    br label %[[PRED_UDIV_CONTINUE8]]
; CHECK:       [[PRED_UDIV_CONTINUE8]]:
; CHECK-NEXT:    [[TMP6:%.*]] = phi i64 [ poison, %[[PRED_UDIV_CONTINUE6]] ], [ [[TMP5]], %[[PRED_UDIV_IF7]] ]
; CHECK-NEXT:    br i1 false, label %[[PRED_UDIV_IF9:.*]], label %[[PRED_UDIV_CONTINUE10:.*]]
; CHECK:       [[PRED_UDIV_IF9]]:
; CHECK-NEXT:    [[TMP7:%.*]] = udiv i64 99, [[D]]
; CHECK-NEXT:    br label %[[PRED_UDIV_CONTINUE10]]
; CHECK:       [[PRED_UDIV_CONTINUE10]]:
; CHECK-NEXT:    br i1 false, label %[[PRED_UDIV_IF11:.*]], label %[[PRED_UDIV_CONTINUE12:.*]]
; CHECK:       [[PRED_UDIV_IF11]]:
; CHECK-NEXT:    [[TMP8:%.*]] = udiv i64 99, [[D]]
; CHECK-NEXT:    br label %[[PRED_UDIV_CONTINUE12]]
; CHECK:       [[PRED_UDIV_CONTINUE12]]:
; CHECK-NEXT:    br i1 false, label %[[PRED_UDIV_IF13:.*]], label %[[PRED_UDIV_CONTINUE14]]
; CHECK:       [[PRED_UDIV_IF13]]:
; CHECK-NEXT:    [[TMP9:%.*]] = udiv i64 99, [[D]]
; CHECK-NEXT:    br label %[[PRED_UDIV_CONTINUE14]]
; CHECK:       [[PRED_UDIV_CONTINUE14]]:
; CHECK-NEXT:    [[PREDPHI:%.*]] = select i1 true, i64 0, i64 [[TMP1]]
; CHECK-NEXT:    [[PREDPHI15:%.*]] = select i1 true, i64 0, i64 [[TMP6]]
; CHECK-NEXT:    [[TMP10:%.*]] = getelementptr i16, ptr [[DST]], i64 [[PREDPHI]]
; CHECK-NEXT:    [[TMP11:%.*]] = getelementptr i16, ptr [[DST]], i64 [[PREDPHI15]]
; CHECK-NEXT:    store i16 0, ptr [[TMP10]], align 2
; CHECK-NEXT:    store i16 0, ptr [[TMP11]], align 2
; CHECK-NEXT:    [[INDEX_NEXT]] = add nuw i64 [[INDEX]], 8
; CHECK-NEXT:    [[TMP12:%.*]] = icmp eq i64 [[INDEX_NEXT]], 96
; CHECK-NEXT:    br i1 [[TMP12]], label %[[MIDDLE_BLOCK:.*]], label %[[VECTOR_BODY]], !llvm.loop [[LOOP0:![0-9]+]]
; CHECK:       [[MIDDLE_BLOCK]]:
; CHECK-NEXT:    br i1 false, label %[[EXIT:.*]], label %[[SCALAR_PH]]
; CHECK:       [[SCALAR_PH]]:
; CHECK-NEXT:    [[BC_RESUME_VAL:%.*]] = phi i64 [ 96, %[[MIDDLE_BLOCK]] ], [ 0, %[[ENTRY]] ]
; CHECK-NEXT:    br label %[[LOOP_HEADER:.*]]
; CHECK:       [[LOOP_HEADER]]:
; CHECK-NEXT:    [[IV:%.*]] = phi i64 [ [[BC_RESUME_VAL]], %[[SCALAR_PH]] ], [ [[IV_NEXT:%.*]], %[[LOOP_LATCH:.*]] ]
; CHECK-NEXT:    br i1 true, label %[[LOOP_LATCH]], label %[[ELSE:.*]]
; CHECK:       [[ELSE]]:
; CHECK-NEXT:    [[DIV_I:%.*]] = udiv i64 99, [[D]]
; CHECK-NEXT:    br label %[[LOOP_LATCH]]
; CHECK:       [[LOOP_LATCH]]:
; CHECK-NEXT:    [[RETVAL_0_I:%.*]] = phi i64 [ [[DIV_I]], %[[ELSE]] ], [ 0, %[[LOOP_HEADER]] ]
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr i16, ptr [[DST]], i64 [[RETVAL_0_I]]
; CHECK-NEXT:    store i16 0, ptr [[GEP]], align 2
; CHECK-NEXT:    [[IV_NEXT]] = add i64 [[IV]], 1
; CHECK-NEXT:    [[CMP:%.*]] = icmp ult i64 [[IV_NEXT]], 101
; CHECK-NEXT:    br i1 [[CMP]], label %[[LOOP_HEADER]], label %[[EXIT]], !llvm.loop [[LOOP3:![0-9]+]]
; CHECK:       [[EXIT]]:
; CHECK-NEXT:    ret void
;
entry:
  %c = icmp eq i32 %x, 10
  br label %loop.header

loop.header:                                         ; preds = %loop.latch, %entry
  %iv = phi i64 [ 0, %entry ], [ %iv.next, %loop.latch ]
  br i1 true, label %loop.latch, label %else

else:
  %div.i = udiv i64 99, %d
  br label %loop.latch

loop.latch:
  %retval.0.i = phi i64 [ %div.i, %else ], [ 0, %loop.header ]
  %gep = getelementptr i16, ptr %dst, i64 %retval.0.i
  store i16 0, ptr %gep, align 2
  %iv.next = add i64 %iv, 1
  %cmp = icmp ult i64 %iv.next, 101
  br i1 %cmp, label %loop.header, label %exit

exit:
  ret void
}
;.
; CHECK: [[LOOP0]] = distinct !{[[LOOP0]], [[META1:![0-9]+]], [[META2:![0-9]+]]}
; CHECK: [[META1]] = !{!"llvm.loop.isvectorized", i32 1}
; CHECK: [[META2]] = !{!"llvm.loop.unroll.runtime.disable"}
; CHECK: [[LOOP3]] = distinct !{[[LOOP3]], [[META2]], [[META1]]}
;.
