# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -march=aarch64 -mcpu=exynos-m1 -resource-pressure=false < %s | FileCheck %s -check-prefixes=ALL,EM1
# RUN: llvm-mca -march=aarch64 -mcpu=exynos-m3 -resource-pressure=false < %s | FileCheck %s -check-prefixes=ALL,EM3

  adds	w0, w1, w2, lsl #0
  sub	x3, x4, x5, lsr #1
  ands	x6, x7, x8, lsl #2
  orr	w9, w10, w11, asr #3
  adds	w12, w13, w14, lsl #4
  sub	x15, x16, x17, lsr #6
  ands	x18, x19, x20, lsl #8
  orr	w21, w22, w23, asr #10

# ALL:      Iterations:        100
# ALL-NEXT: Instructions:      800

# EM1-NEXT: Total Cycles:      470
# EM3-NEXT: Total Cycles:      354

# ALL-NEXT: Total uOps:        800

# EM1:      Dispatch Width:    4
# EM1-NEXT: uOps Per Cycle:    1.70
# EM1-NEXT: IPC:               1.70
# EM1-NEXT: Block RThroughput: 4.7

# EM3:      Dispatch Width:    6
# EM3-NEXT: uOps Per Cycle:    2.26
# EM3-NEXT: IPC:               2.26
# EM3-NEXT: Block RThroughput: 3.5

# ALL:      Instruction Info:
# ALL-NEXT: [1]: #uOps
# ALL-NEXT: [2]: Latency
# ALL-NEXT: [3]: RThroughput
# ALL-NEXT: [4]: MayLoad
# ALL-NEXT: [5]: MayStore
# ALL-NEXT: [6]: HasSideEffects (U)

# ALL:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:

# EM1-NEXT:  1      1     0.33                        adds	w0, w1, w2
# EM1-NEXT:  1      2     0.67                        sub	x3, x4, x5, lsr #1
# EM1-NEXT:  1      1     0.33                        ands	x6, x7, x8, lsl #2
# EM1-NEXT:  1      2     0.67                        orr	w9, w10, w11, asr #3
# EM1-NEXT:  1      2     0.67                        adds	w12, w13, w14, lsl #4
# EM1-NEXT:  1      2     0.67                        sub	x15, x16, x17, lsr #6
# EM1-NEXT:  1      2     0.67                        ands	x18, x19, x20, lsl #8
# EM1-NEXT:  1      2     0.67                        orr	w21, w22, w23, asr #10

# EM3-NEXT:  1      1     0.25                        adds	w0, w1, w2
# EM3-NEXT:  1      2     0.50                        sub	x3, x4, x5, lsr #1
# EM3-NEXT:  1      1     0.25                        ands	x6, x7, x8, lsl #2
# EM3-NEXT:  1      2     0.50                        orr	w9, w10, w11, asr #3
# EM3-NEXT:  1      2     0.50                        adds	w12, w13, w14, lsl #4
# EM3-NEXT:  1      2     0.50                        sub	x15, x16, x17, lsr #6
# EM3-NEXT:  1      2     0.50                        ands	x18, x19, x20, lsl #8
# EM3-NEXT:  1      2     0.50                        orr	w21, w22, w23, asr #10
