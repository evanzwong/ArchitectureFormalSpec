# ArchitectureFormalSpec
Final project by Evan Wong and Adrian Abold for UC Berkeley class EE 144: Fundamental Algorithms for Systems Modeling, Analysis, and Optimization.

Objective: Formally model basic computer microarchitectures in CPUs such as speculative execution and branch prediction to prevent basic security violations in architecture design.

What is contained in this repo: Edited files from the Chipyard install (when running `./build-setup.sh riscv-tools`, add `-s 6 -s 7 -s 8 -s 9`).

Have to run ``source "${HOME}/conda/etc/profile.d/conda.sh"`` when opening WSL.

Config File: Taken from `chipyard/generators/rocket-chip/src/main/scala/system/` and the config we added is "Project144Config"

Progress:

4/18/25 - Confirmed minimal configuration and created repo

4/23 - Tested configuration using Verilator running:
```cd sims/verilator
make CONFIG=Project144Config```

Created riscvmelttest.S which is an assembly test to be compiled into RISC-V using probably the Makefile in the risc-v toolchain. No guarantee it works though.




