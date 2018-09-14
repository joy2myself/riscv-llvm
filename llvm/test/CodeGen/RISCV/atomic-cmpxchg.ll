; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV32I %s

define void @cmpxchg_i8_monotonic_monotonic(i8* %ptr, i8 %cmp, i8 %val) {
; RV32I-LABEL: cmpxchg_i8_monotonic_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sb a1, 11(sp)
; RV32I-NEXT:    addi a1, sp, 11
; RV32I-NEXT:    mv a3, zero
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_1
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i8* %ptr, i8 %cmp, i8 %val monotonic monotonic
  ret void
}

define void @cmpxchg_i8_acquire_monotonic(i8* %ptr, i8 %cmp, i8 %val) {
; RV32I-LABEL: cmpxchg_i8_acquire_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sb a1, 11(sp)
; RV32I-NEXT:    addi a1, sp, 11
; RV32I-NEXT:    addi a3, zero, 2
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_1
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i8* %ptr, i8 %cmp, i8 %val acquire monotonic
  ret void
}

define void @cmpxchg_i8_acquire_acquire(i8* %ptr, i8 %cmp, i8 %val) {
; RV32I-LABEL: cmpxchg_i8_acquire_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sb a1, 11(sp)
; RV32I-NEXT:    addi a1, sp, 11
; RV32I-NEXT:    addi a3, zero, 2
; RV32I-NEXT:    mv a4, a3
; RV32I-NEXT:    call __atomic_compare_exchange_1
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i8* %ptr, i8 %cmp, i8 %val acquire acquire
  ret void
}

define void @cmpxchg_i8_release_monotonic(i8* %ptr, i8 %cmp, i8 %val) {
; RV32I-LABEL: cmpxchg_i8_release_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sb a1, 11(sp)
; RV32I-NEXT:    addi a1, sp, 11
; RV32I-NEXT:    addi a3, zero, 3
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_1
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i8* %ptr, i8 %cmp, i8 %val release monotonic
  ret void
}

define void @cmpxchg_i8_release_acquire(i8* %ptr, i8 %cmp, i8 %val) {
; RV32I-LABEL: cmpxchg_i8_release_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sb a1, 11(sp)
; RV32I-NEXT:    addi a1, sp, 11
; RV32I-NEXT:    addi a3, zero, 3
; RV32I-NEXT:    addi a4, zero, 2
; RV32I-NEXT:    call __atomic_compare_exchange_1
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i8* %ptr, i8 %cmp, i8 %val release acquire
  ret void
}

define void @cmpxchg_i8_acq_rel_monotonic(i8* %ptr, i8 %cmp, i8 %val) {
; RV32I-LABEL: cmpxchg_i8_acq_rel_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sb a1, 11(sp)
; RV32I-NEXT:    addi a1, sp, 11
; RV32I-NEXT:    addi a3, zero, 4
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_1
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i8* %ptr, i8 %cmp, i8 %val acq_rel monotonic
  ret void
}

define void @cmpxchg_i8_acq_rel_acquire(i8* %ptr, i8 %cmp, i8 %val) {
; RV32I-LABEL: cmpxchg_i8_acq_rel_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sb a1, 11(sp)
; RV32I-NEXT:    addi a1, sp, 11
; RV32I-NEXT:    addi a3, zero, 4
; RV32I-NEXT:    addi a4, zero, 2
; RV32I-NEXT:    call __atomic_compare_exchange_1
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i8* %ptr, i8 %cmp, i8 %val acq_rel acquire
  ret void
}

define void @cmpxchg_i8_seq_cst_monotonic(i8* %ptr, i8 %cmp, i8 %val) {
; RV32I-LABEL: cmpxchg_i8_seq_cst_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sb a1, 11(sp)
; RV32I-NEXT:    addi a1, sp, 11
; RV32I-NEXT:    addi a3, zero, 5
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_1
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i8* %ptr, i8 %cmp, i8 %val seq_cst monotonic
  ret void
}

define void @cmpxchg_i8_seq_cst_acquire(i8* %ptr, i8 %cmp, i8 %val) {
; RV32I-LABEL: cmpxchg_i8_seq_cst_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sb a1, 11(sp)
; RV32I-NEXT:    addi a1, sp, 11
; RV32I-NEXT:    addi a3, zero, 5
; RV32I-NEXT:    addi a4, zero, 2
; RV32I-NEXT:    call __atomic_compare_exchange_1
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i8* %ptr, i8 %cmp, i8 %val seq_cst acquire
  ret void
}

define void @cmpxchg_i8_seq_cst_seq_cst(i8* %ptr, i8 %cmp, i8 %val) {
; RV32I-LABEL: cmpxchg_i8_seq_cst_seq_cst:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sb a1, 11(sp)
; RV32I-NEXT:    addi a1, sp, 11
; RV32I-NEXT:    addi a3, zero, 5
; RV32I-NEXT:    mv a4, a3
; RV32I-NEXT:    call __atomic_compare_exchange_1
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i8* %ptr, i8 %cmp, i8 %val seq_cst seq_cst
  ret void
}

define void @cmpxchg_i16_monotonic_monotonic(i16* %ptr, i16 %cmp, i16 %val) {
; RV32I-LABEL: cmpxchg_i16_monotonic_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sh a1, 10(sp)
; RV32I-NEXT:    addi a1, sp, 10
; RV32I-NEXT:    mv a3, zero
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_2
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i16* %ptr, i16 %cmp, i16 %val monotonic monotonic
  ret void
}

define void @cmpxchg_i16_acquire_monotonic(i16* %ptr, i16 %cmp, i16 %val) {
; RV32I-LABEL: cmpxchg_i16_acquire_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sh a1, 10(sp)
; RV32I-NEXT:    addi a1, sp, 10
; RV32I-NEXT:    addi a3, zero, 2
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_2
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i16* %ptr, i16 %cmp, i16 %val acquire monotonic
  ret void
}

define void @cmpxchg_i16_acquire_acquire(i16* %ptr, i16 %cmp, i16 %val) {
; RV32I-LABEL: cmpxchg_i16_acquire_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sh a1, 10(sp)
; RV32I-NEXT:    addi a1, sp, 10
; RV32I-NEXT:    addi a3, zero, 2
; RV32I-NEXT:    mv a4, a3
; RV32I-NEXT:    call __atomic_compare_exchange_2
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i16* %ptr, i16 %cmp, i16 %val acquire acquire
  ret void
}

define void @cmpxchg_i16_release_monotonic(i16* %ptr, i16 %cmp, i16 %val) {
; RV32I-LABEL: cmpxchg_i16_release_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sh a1, 10(sp)
; RV32I-NEXT:    addi a1, sp, 10
; RV32I-NEXT:    addi a3, zero, 3
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_2
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i16* %ptr, i16 %cmp, i16 %val release monotonic
  ret void
}

define void @cmpxchg_i16_release_acquire(i16* %ptr, i16 %cmp, i16 %val) {
; RV32I-LABEL: cmpxchg_i16_release_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sh a1, 10(sp)
; RV32I-NEXT:    addi a1, sp, 10
; RV32I-NEXT:    addi a3, zero, 3
; RV32I-NEXT:    addi a4, zero, 2
; RV32I-NEXT:    call __atomic_compare_exchange_2
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i16* %ptr, i16 %cmp, i16 %val release acquire
  ret void
}

define void @cmpxchg_i16_acq_rel_monotonic(i16* %ptr, i16 %cmp, i16 %val) {
; RV32I-LABEL: cmpxchg_i16_acq_rel_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sh a1, 10(sp)
; RV32I-NEXT:    addi a1, sp, 10
; RV32I-NEXT:    addi a3, zero, 4
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_2
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i16* %ptr, i16 %cmp, i16 %val acq_rel monotonic
  ret void
}

define void @cmpxchg_i16_acq_rel_acquire(i16* %ptr, i16 %cmp, i16 %val) {
; RV32I-LABEL: cmpxchg_i16_acq_rel_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sh a1, 10(sp)
; RV32I-NEXT:    addi a1, sp, 10
; RV32I-NEXT:    addi a3, zero, 4
; RV32I-NEXT:    addi a4, zero, 2
; RV32I-NEXT:    call __atomic_compare_exchange_2
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i16* %ptr, i16 %cmp, i16 %val acq_rel acquire
  ret void
}

define void @cmpxchg_i16_seq_cst_monotonic(i16* %ptr, i16 %cmp, i16 %val) {
; RV32I-LABEL: cmpxchg_i16_seq_cst_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sh a1, 10(sp)
; RV32I-NEXT:    addi a1, sp, 10
; RV32I-NEXT:    addi a3, zero, 5
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_2
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i16* %ptr, i16 %cmp, i16 %val seq_cst monotonic
  ret void
}

define void @cmpxchg_i16_seq_cst_acquire(i16* %ptr, i16 %cmp, i16 %val) {
; RV32I-LABEL: cmpxchg_i16_seq_cst_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sh a1, 10(sp)
; RV32I-NEXT:    addi a1, sp, 10
; RV32I-NEXT:    addi a3, zero, 5
; RV32I-NEXT:    addi a4, zero, 2
; RV32I-NEXT:    call __atomic_compare_exchange_2
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i16* %ptr, i16 %cmp, i16 %val seq_cst acquire
  ret void
}

define void @cmpxchg_i16_seq_cst_seq_cst(i16* %ptr, i16 %cmp, i16 %val) {
; RV32I-LABEL: cmpxchg_i16_seq_cst_seq_cst:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sh a1, 10(sp)
; RV32I-NEXT:    addi a1, sp, 10
; RV32I-NEXT:    addi a3, zero, 5
; RV32I-NEXT:    mv a4, a3
; RV32I-NEXT:    call __atomic_compare_exchange_2
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i16* %ptr, i16 %cmp, i16 %val seq_cst seq_cst
  ret void
}

define void @cmpxchg_i32_monotonic_monotonic(i32* %ptr, i32 %cmp, i32 %val) {
; RV32I-LABEL: cmpxchg_i32_monotonic_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a1, 8(sp)
; RV32I-NEXT:    addi a1, sp, 8
; RV32I-NEXT:    mv a3, zero
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_4
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i32* %ptr, i32 %cmp, i32 %val monotonic monotonic
  ret void
}

define void @cmpxchg_i32_acquire_monotonic(i32* %ptr, i32 %cmp, i32 %val) {
; RV32I-LABEL: cmpxchg_i32_acquire_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a1, 8(sp)
; RV32I-NEXT:    addi a1, sp, 8
; RV32I-NEXT:    addi a3, zero, 2
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_4
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i32* %ptr, i32 %cmp, i32 %val acquire monotonic
  ret void
}

define void @cmpxchg_i32_acquire_acquire(i32* %ptr, i32 %cmp, i32 %val) {
; RV32I-LABEL: cmpxchg_i32_acquire_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a1, 8(sp)
; RV32I-NEXT:    addi a1, sp, 8
; RV32I-NEXT:    addi a3, zero, 2
; RV32I-NEXT:    mv a4, a3
; RV32I-NEXT:    call __atomic_compare_exchange_4
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i32* %ptr, i32 %cmp, i32 %val acquire acquire
  ret void
}

define void @cmpxchg_i32_release_monotonic(i32* %ptr, i32 %cmp, i32 %val) {
; RV32I-LABEL: cmpxchg_i32_release_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a1, 8(sp)
; RV32I-NEXT:    addi a1, sp, 8
; RV32I-NEXT:    addi a3, zero, 3
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_4
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i32* %ptr, i32 %cmp, i32 %val release monotonic
  ret void
}

define void @cmpxchg_i32_release_acquire(i32* %ptr, i32 %cmp, i32 %val) {
; RV32I-LABEL: cmpxchg_i32_release_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a1, 8(sp)
; RV32I-NEXT:    addi a1, sp, 8
; RV32I-NEXT:    addi a3, zero, 3
; RV32I-NEXT:    addi a4, zero, 2
; RV32I-NEXT:    call __atomic_compare_exchange_4
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i32* %ptr, i32 %cmp, i32 %val release acquire
  ret void
}

define void @cmpxchg_i32_acq_rel_monotonic(i32* %ptr, i32 %cmp, i32 %val) {
; RV32I-LABEL: cmpxchg_i32_acq_rel_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a1, 8(sp)
; RV32I-NEXT:    addi a1, sp, 8
; RV32I-NEXT:    addi a3, zero, 4
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_4
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i32* %ptr, i32 %cmp, i32 %val acq_rel monotonic
  ret void
}

define void @cmpxchg_i32_acq_rel_acquire(i32* %ptr, i32 %cmp, i32 %val) {
; RV32I-LABEL: cmpxchg_i32_acq_rel_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a1, 8(sp)
; RV32I-NEXT:    addi a1, sp, 8
; RV32I-NEXT:    addi a3, zero, 4
; RV32I-NEXT:    addi a4, zero, 2
; RV32I-NEXT:    call __atomic_compare_exchange_4
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i32* %ptr, i32 %cmp, i32 %val acq_rel acquire
  ret void
}

define void @cmpxchg_i32_seq_cst_monotonic(i32* %ptr, i32 %cmp, i32 %val) {
; RV32I-LABEL: cmpxchg_i32_seq_cst_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a1, 8(sp)
; RV32I-NEXT:    addi a1, sp, 8
; RV32I-NEXT:    addi a3, zero, 5
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    call __atomic_compare_exchange_4
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i32* %ptr, i32 %cmp, i32 %val seq_cst monotonic
  ret void
}

define void @cmpxchg_i32_seq_cst_acquire(i32* %ptr, i32 %cmp, i32 %val) {
; RV32I-LABEL: cmpxchg_i32_seq_cst_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a1, 8(sp)
; RV32I-NEXT:    addi a1, sp, 8
; RV32I-NEXT:    addi a3, zero, 5
; RV32I-NEXT:    addi a4, zero, 2
; RV32I-NEXT:    call __atomic_compare_exchange_4
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i32* %ptr, i32 %cmp, i32 %val seq_cst acquire
  ret void
}

define void @cmpxchg_i32_seq_cst_seq_cst(i32* %ptr, i32 %cmp, i32 %val) {
; RV32I-LABEL: cmpxchg_i32_seq_cst_seq_cst:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a1, 8(sp)
; RV32I-NEXT:    addi a1, sp, 8
; RV32I-NEXT:    addi a3, zero, 5
; RV32I-NEXT:    mv a4, a3
; RV32I-NEXT:    call __atomic_compare_exchange_4
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i32* %ptr, i32 %cmp, i32 %val seq_cst seq_cst
  ret void
}

define void @cmpxchg_i64_monotonic_monotonic(i64* %ptr, i64 %cmp, i64 %val) {
; RV32I-LABEL: cmpxchg_i64_monotonic_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a2, 4(sp)
; RV32I-NEXT:    sw a1, 0(sp)
; RV32I-NEXT:    mv a1, sp
; RV32I-NEXT:    mv a2, a3
; RV32I-NEXT:    mv a3, a4
; RV32I-NEXT:    mv a4, zero
; RV32I-NEXT:    mv a5, zero
; RV32I-NEXT:    call __atomic_compare_exchange_8
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i64* %ptr, i64 %cmp, i64 %val monotonic monotonic
  ret void
}

define void @cmpxchg_i64_acquire_monotonic(i64* %ptr, i64 %cmp, i64 %val) {
; RV32I-LABEL: cmpxchg_i64_acquire_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a2, 4(sp)
; RV32I-NEXT:    sw a1, 0(sp)
; RV32I-NEXT:    mv a1, sp
; RV32I-NEXT:    addi a5, zero, 2
; RV32I-NEXT:    mv a2, a3
; RV32I-NEXT:    mv a3, a4
; RV32I-NEXT:    mv a4, a5
; RV32I-NEXT:    mv a5, zero
; RV32I-NEXT:    call __atomic_compare_exchange_8
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i64* %ptr, i64 %cmp, i64 %val acquire monotonic
  ret void
}

define void @cmpxchg_i64_acquire_acquire(i64* %ptr, i64 %cmp, i64 %val) {
; RV32I-LABEL: cmpxchg_i64_acquire_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a2, 4(sp)
; RV32I-NEXT:    sw a1, 0(sp)
; RV32I-NEXT:    mv a1, sp
; RV32I-NEXT:    addi a5, zero, 2
; RV32I-NEXT:    mv a2, a3
; RV32I-NEXT:    mv a3, a4
; RV32I-NEXT:    mv a4, a5
; RV32I-NEXT:    call __atomic_compare_exchange_8
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i64* %ptr, i64 %cmp, i64 %val acquire acquire
  ret void
}

define void @cmpxchg_i64_release_monotonic(i64* %ptr, i64 %cmp, i64 %val) {
; RV32I-LABEL: cmpxchg_i64_release_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a2, 4(sp)
; RV32I-NEXT:    sw a1, 0(sp)
; RV32I-NEXT:    mv a1, sp
; RV32I-NEXT:    addi a5, zero, 3
; RV32I-NEXT:    mv a2, a3
; RV32I-NEXT:    mv a3, a4
; RV32I-NEXT:    mv a4, a5
; RV32I-NEXT:    mv a5, zero
; RV32I-NEXT:    call __atomic_compare_exchange_8
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i64* %ptr, i64 %cmp, i64 %val release monotonic
  ret void
}

define void @cmpxchg_i64_release_acquire(i64* %ptr, i64 %cmp, i64 %val) {
; RV32I-LABEL: cmpxchg_i64_release_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a2, 4(sp)
; RV32I-NEXT:    sw a1, 0(sp)
; RV32I-NEXT:    mv a1, sp
; RV32I-NEXT:    addi a6, zero, 3
; RV32I-NEXT:    addi a5, zero, 2
; RV32I-NEXT:    mv a2, a3
; RV32I-NEXT:    mv a3, a4
; RV32I-NEXT:    mv a4, a6
; RV32I-NEXT:    call __atomic_compare_exchange_8
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i64* %ptr, i64 %cmp, i64 %val release acquire
  ret void
}

define void @cmpxchg_i64_acq_rel_monotonic(i64* %ptr, i64 %cmp, i64 %val) {
; RV32I-LABEL: cmpxchg_i64_acq_rel_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a2, 4(sp)
; RV32I-NEXT:    sw a1, 0(sp)
; RV32I-NEXT:    mv a1, sp
; RV32I-NEXT:    addi a5, zero, 4
; RV32I-NEXT:    mv a2, a3
; RV32I-NEXT:    mv a3, a4
; RV32I-NEXT:    mv a4, a5
; RV32I-NEXT:    mv a5, zero
; RV32I-NEXT:    call __atomic_compare_exchange_8
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i64* %ptr, i64 %cmp, i64 %val acq_rel monotonic
  ret void
}

define void @cmpxchg_i64_acq_rel_acquire(i64* %ptr, i64 %cmp, i64 %val) {
; RV32I-LABEL: cmpxchg_i64_acq_rel_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a2, 4(sp)
; RV32I-NEXT:    sw a1, 0(sp)
; RV32I-NEXT:    mv a1, sp
; RV32I-NEXT:    addi a6, zero, 4
; RV32I-NEXT:    addi a5, zero, 2
; RV32I-NEXT:    mv a2, a3
; RV32I-NEXT:    mv a3, a4
; RV32I-NEXT:    mv a4, a6
; RV32I-NEXT:    call __atomic_compare_exchange_8
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i64* %ptr, i64 %cmp, i64 %val acq_rel acquire
  ret void
}

define void @cmpxchg_i64_seq_cst_monotonic(i64* %ptr, i64 %cmp, i64 %val) {
; RV32I-LABEL: cmpxchg_i64_seq_cst_monotonic:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a2, 4(sp)
; RV32I-NEXT:    sw a1, 0(sp)
; RV32I-NEXT:    mv a1, sp
; RV32I-NEXT:    addi a5, zero, 5
; RV32I-NEXT:    mv a2, a3
; RV32I-NEXT:    mv a3, a4
; RV32I-NEXT:    mv a4, a5
; RV32I-NEXT:    mv a5, zero
; RV32I-NEXT:    call __atomic_compare_exchange_8
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i64* %ptr, i64 %cmp, i64 %val seq_cst monotonic
  ret void
}

define void @cmpxchg_i64_seq_cst_acquire(i64* %ptr, i64 %cmp, i64 %val) {
; RV32I-LABEL: cmpxchg_i64_seq_cst_acquire:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a2, 4(sp)
; RV32I-NEXT:    sw a1, 0(sp)
; RV32I-NEXT:    mv a1, sp
; RV32I-NEXT:    addi a6, zero, 5
; RV32I-NEXT:    addi a5, zero, 2
; RV32I-NEXT:    mv a2, a3
; RV32I-NEXT:    mv a3, a4
; RV32I-NEXT:    mv a4, a6
; RV32I-NEXT:    call __atomic_compare_exchange_8
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i64* %ptr, i64 %cmp, i64 %val seq_cst acquire
  ret void
}

define void @cmpxchg_i64_seq_cst_seq_cst(i64* %ptr, i64 %cmp, i64 %val) {
; RV32I-LABEL: cmpxchg_i64_seq_cst_seq_cst:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    .cfi_def_cfa_offset 16
; RV32I-NEXT:    .cfi_offset 1, -4
; RV32I-NEXT:    sw a2, 4(sp)
; RV32I-NEXT:    sw a1, 0(sp)
; RV32I-NEXT:    mv a1, sp
; RV32I-NEXT:    addi a5, zero, 5
; RV32I-NEXT:    mv a2, a3
; RV32I-NEXT:    mv a3, a4
; RV32I-NEXT:    mv a4, a5
; RV32I-NEXT:    call __atomic_compare_exchange_8
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
  %res = cmpxchg i64* %ptr, i64 %cmp, i64 %val seq_cst seq_cst
  ret void
}
