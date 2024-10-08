; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mattr=+sve < %s | FileCheck %s

target triple = "aarch64-unknown-linux-gnu"

;
; AND
;

define <vscale x 16 x i8> @and_i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a, <vscale x 16 x i8> %b) {
; CHECK-LABEL: and_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.and.u.nxv16i8(<vscale x 16 x i1> %pg,
                                                                 <vscale x 16 x i8> %a,
                                                                 <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @and_i16(<vscale x 8 x i1> %pg, <vscale x 8 x i16> %a, <vscale x 8 x i16> %b) {
; CHECK-LABEL: and_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.and.u.nxv8i16(<vscale x 8 x i1> %pg,
                                                                 <vscale x 8 x i16> %a,
                                                                 <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @and_i32(<vscale x 4 x i1> %pg, <vscale x 4 x i32> %a, <vscale x 4 x i32> %b) {
; CHECK-LABEL: and_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.and.u.nxv4i32(<vscale x 4 x i1> %pg,
                                                                 <vscale x 4 x i32> %a,
                                                                 <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @and_i64(<vscale x 2 x i1> %pg, <vscale x 2 x i64> %a, <vscale x 2 x i64> %b) {
; CHECK-LABEL: and_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.and.u.nxv2i64(<vscale x 2 x i1> %pg,
                                                                 <vscale x 2 x i64> %a,
                                                                 <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %out
}

;
; AND (immediate)
;

define <vscale x 16 x i8> @and_imm_i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a) {
; CHECK-LABEL: and_imm_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.b, z0.b, #0x3
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.and.u.nxv16i8(<vscale x 16 x i1> %pg,
                                                                 <vscale x 16 x i8> %a,
                                                                 <vscale x 16 x i8> splat(i8 3))
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @and_imm_i16(<vscale x 8 x i1> %pg, <vscale x 8 x i16> %a) {
; CHECK-LABEL: and_imm_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.h, z0.h, #0x4
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.and.u.nxv8i16(<vscale x 8 x i1> %pg,
                                                                 <vscale x 8 x i16> %a,
                                                                 <vscale x 8 x i16> splat(i16 4))
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @and_imm_i32(<vscale x 4 x i1> %pg, <vscale x 4 x i32> %a) {
; CHECK-LABEL: and_imm_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.s, z0.s, #0x10
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.and.u.nxv4i32(<vscale x 4 x i1> %pg,
                                                                 <vscale x 4 x i32> %a,
                                                                 <vscale x 4 x i32> splat(i32 16))
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @and_imm_i64(<vscale x 2 x i1> %pg, <vscale x 2 x i64> %a) {
; CHECK-LABEL: and_imm_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.d, z0.d, #0x20
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.and.u.nxv2i64(<vscale x 2 x i1> %pg,
                                                                 <vscale x 2 x i64> %a,
                                                                 <vscale x 2 x i64> splat(i64 32))
  ret <vscale x 2 x i64> %out
}

;
; EOR
;

define <vscale x 16 x i8> @eor_i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a, <vscale x 16 x i8> %b) {
; CHECK-LABEL: eor_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.eor.u.nxv16i8(<vscale x 16 x i1> %pg,
                                                                 <vscale x 16 x i8> %a,
                                                                 <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @eor_i16(<vscale x 8 x i1> %pg, <vscale x 8 x i16> %a, <vscale x 8 x i16> %b) {
; CHECK-LABEL: eor_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.eor.u.nxv8i16(<vscale x 8 x i1> %pg,
                                                                 <vscale x 8 x i16> %a,
                                                                 <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @eor_i32(<vscale x 4 x i1> %pg, <vscale x 4 x i32> %a, <vscale x 4 x i32> %b) {
; CHECK-LABEL: eor_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.eor.u.nxv4i32(<vscale x 4 x i1> %pg,
                                                                 <vscale x 4 x i32> %a,
                                                                 <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @eor_i64(<vscale x 2 x i1> %pg, <vscale x 2 x i64> %a, <vscale x 2 x i64> %b) {
; CHECK-LABEL: eor_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.eor.u.nxv2i64(<vscale x 2 x i1> %pg,
                                                                 <vscale x 2 x i64> %a,
                                                                 <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %out
}

;
; EOR (immediate)
;

define <vscale x 16 x i8> @eor_imm_i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a) {
; CHECK-LABEL: eor_imm_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor z0.b, z0.b, #0x7
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.eor.u.nxv16i8(<vscale x 16 x i1> %pg,
                                                                 <vscale x 16 x i8> %a,
                                                                 <vscale x 16 x i8> splat(i8 7))
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @eor_imm_i16(<vscale x 8 x i1> %pg, <vscale x 8 x i16> %a) {
; CHECK-LABEL: eor_imm_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor z0.h, z0.h, #0x8
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.eor.u.nxv8i16(<vscale x 8 x i1> %pg,
                                                                 <vscale x 8 x i16> %a,
                                                                 <vscale x 8 x i16> splat(i16 8))
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @eor_imm_i32(<vscale x 4 x i1> %pg, <vscale x 4 x i32> %a) {
; CHECK-LABEL: eor_imm_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor z0.s, z0.s, #0x10
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.eor.u.nxv4i32(<vscale x 4 x i1> %pg,
                                                                 <vscale x 4 x i32> %a,
                                                                 <vscale x 4 x i32> splat(i32 16))
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @eor_imm_i64(<vscale x 2 x i1> %pg, <vscale x 2 x i64> %a) {
; CHECK-LABEL: eor_imm_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor z0.d, z0.d, #0x20
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.eor.u.nxv2i64(<vscale x 2 x i1> %pg,
                                                                 <vscale x 2 x i64> %a,
                                                                 <vscale x 2 x i64> splat(i64 32))
  ret <vscale x 2 x i64> %out
}

;
; ORR
;

define <vscale x 16 x i8> @orr_i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a, <vscale x 16 x i8> %b) {
; CHECK-LABEL: orr_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.orr.u.nxv16i8(<vscale x 16 x i1> %pg,
                                                                 <vscale x 16 x i8> %a,
                                                                 <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @orr_i16(<vscale x 8 x i1> %pg, <vscale x 8 x i16> %a, <vscale x 8 x i16> %b) {
; CHECK-LABEL: orr_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.orr.u.nxv8i16(<vscale x 8 x i1> %pg,
                                                                 <vscale x 8 x i16> %a,
                                                                 <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @orr_i32(<vscale x 4 x i1> %pg, <vscale x 4 x i32> %a, <vscale x 4 x i32> %b) {
; CHECK-LABEL: orr_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.orr.u.nxv4i32(<vscale x 4 x i1> %pg,
                                                                 <vscale x 4 x i32> %a,
                                                                 <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @orr_i64(<vscale x 2 x i1> %pg, <vscale x 2 x i64> %a, <vscale x 2 x i64> %b) {
; CHECK-LABEL: orr_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.orr.u.nxv2i64(<vscale x 2 x i1> %pg,
                                                                 <vscale x 2 x i64> %a,
                                                                 <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %out
}

;
; ORR (immediate)
;

define <vscale x 16 x i8> @orr_imm_i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a) {
; CHECK-LABEL: orr_imm_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr z0.b, z0.b, #0x8
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.orr.u.nxv16i8(<vscale x 16 x i1> %pg,
                                                                 <vscale x 16 x i8> %a,
                                                                 <vscale x 16 x i8> splat(i8 8))
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @orr_imm_i16(<vscale x 8 x i1> %pg, <vscale x 8 x i16> %a) {
; CHECK-LABEL: orr_imm_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr z0.h, z0.h, #0xc
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.orr.u.nxv8i16(<vscale x 8 x i1> %pg,
                                                                 <vscale x 8 x i16> %a,
                                                                 <vscale x 8 x i16> splat(i16 12))
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @orr_imm_i32(<vscale x 4 x i1> %pg, <vscale x 4 x i32> %a) {
; CHECK-LABEL: orr_imm_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr z0.s, z0.s, #0x10
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.orr.u.nxv4i32(<vscale x 4 x i1> %pg,
                                                                 <vscale x 4 x i32> %a,
                                                                 <vscale x 4 x i32> splat(i32 16))
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @orr_imm_i64(<vscale x 2 x i1> %pg, <vscale x 2 x i64> %a) {
; CHECK-LABEL: orr_imm_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr z0.d, z0.d, #0x20
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.orr.u.nxv2i64(<vscale x 2 x i1> %pg,
                                                                 <vscale x 2 x i64> %a,
                                                                 <vscale x 2 x i64> splat(i64 32))
  ret <vscale x 2 x i64> %out
}

;
; BIC
;

define <vscale x 16 x i8> @bic_i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a, <vscale x 16 x i8> %b) {
; CHECK-LABEL: bic_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    bic z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.bic.u.nxv16i8(<vscale x 16 x i1> %pg,
                                                                 <vscale x 16 x i8> %a,
                                                                 <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @bic_i16(<vscale x 8 x i1> %pg, <vscale x 8 x i16> %a, <vscale x 8 x i16> %b) {
; CHECK-LABEL: bic_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    bic z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.bic.u.nxv8i16(<vscale x 8 x i1> %pg,
                                                                 <vscale x 8 x i16> %a,
                                                                 <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @bic_i32(<vscale x 4 x i1> %pg, <vscale x 4 x i32> %a, <vscale x 4 x i32> %b) {
; CHECK-LABEL: bic_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    bic z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.bic.u.nxv4i32(<vscale x 4 x i1> %pg,
                                                                 <vscale x 4 x i32> %a,
                                                                 <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @bic_i64(<vscale x 2 x i1> %pg, <vscale x 2 x i64> %a, <vscale x 2 x i64> %b) {
; CHECK-LABEL: bic_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    bic z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.bic.u.nxv2i64(<vscale x 2 x i1> %pg,
                                                                 <vscale x 2 x i64> %a,
                                                                 <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %out
}

;
; BIC (immediate)
;

define <vscale x 16 x i8> @bic_imm_i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a) {
; CHECK-LABEL: bic_imm_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.b, z0.b, #0xf8
; CHECK-NEXT:    ret
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.bic.u.nxv16i8(<vscale x 16 x i1> %pg,
                                                                 <vscale x 16 x i8> %a,
                                                                 <vscale x 16 x i8> splat(i8 7))
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @bic_imm_i16(<vscale x 8 x i1> %pg, <vscale x 8 x i16> %a) {
; CHECK-LABEL: bic_imm_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.h, z0.h, #0xfff7
; CHECK-NEXT:    ret
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.bic.u.nxv8i16(<vscale x 8 x i1> %pg,
                                                                 <vscale x 8 x i16> %a,
                                                                 <vscale x 8 x i16> splat(i16 8))
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @bic_imm_i32(<vscale x 4 x i1> %pg, <vscale x 4 x i32> %a) {
; CHECK-LABEL: bic_imm_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.s, z0.s, #0xffffffef
; CHECK-NEXT:    ret
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.bic.u.nxv4i32(<vscale x 4 x i1> %pg,
                                                                 <vscale x 4 x i32> %a,
                                                                 <vscale x 4 x i32> splat(i32 16))
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @bic_imm_i64(<vscale x 2 x i1> %pg, <vscale x 2 x i64> %a) {
; CHECK-LABEL: bic_imm_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and z0.d, z0.d, #0xffffffffffffffdf
; CHECK-NEXT:    ret
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.bic.u.nxv2i64(<vscale x 2 x i1> %pg,
                                                                 <vscale x 2 x i64> %a,
                                                                 <vscale x 2 x i64> splat(i64 32))
  ret <vscale x 2 x i64> %out
}

declare <vscale x 16 x i8> @llvm.aarch64.sve.and.u.nxv16i8(<vscale x 16 x i1>, <vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.and.u.nxv8i16(<vscale x 8 x i1>, <vscale x 8 x i16>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.and.u.nxv4i32(<vscale x 4 x i1>, <vscale x 4 x i32>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.and.u.nxv2i64(<vscale x 2 x i1>, <vscale x 2 x i64>, <vscale x 2 x i64>)

declare <vscale x 16 x i8> @llvm.aarch64.sve.eor.u.nxv16i8(<vscale x 16 x i1>, <vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.eor.u.nxv8i16(<vscale x 8 x i1>, <vscale x 8 x i16>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.eor.u.nxv4i32(<vscale x 4 x i1>, <vscale x 4 x i32>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.eor.u.nxv2i64(<vscale x 2 x i1>, <vscale x 2 x i64>, <vscale x 2 x i64>)

declare <vscale x 16 x i8> @llvm.aarch64.sve.orr.u.nxv16i8(<vscale x 16 x i1>, <vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.orr.u.nxv8i16(<vscale x 8 x i1>, <vscale x 8 x i16>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.orr.u.nxv4i32(<vscale x 4 x i1>, <vscale x 4 x i32>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.orr.u.nxv2i64(<vscale x 2 x i1>, <vscale x 2 x i64>, <vscale x 2 x i64>)

declare <vscale x 16 x i8> @llvm.aarch64.sve.bic.u.nxv16i8(<vscale x 16 x i1>, <vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.bic.u.nxv8i16(<vscale x 8 x i1>, <vscale x 8 x i16>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.bic.u.nxv4i32(<vscale x 4 x i1>, <vscale x 4 x i32>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.bic.u.nxv2i64(<vscale x 2 x i1>, <vscale x 2 x i64>, <vscale x 2 x i64>)
