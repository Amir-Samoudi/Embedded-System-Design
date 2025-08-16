# Core-based Embedded System Design Projects

This repository contains the projects for the **"Core-based Embedded System Design"** course.  
The assignments cover the design, simulation, and implementation of an embedded system built around the **[AFTAB (RV32IM) RISC-V processor core](https://github.com/RHESGroup/aftab)**. The projects progress from a basic simulation to a more complex system with advanced memory interfaces, peripherals, and hardware acceleration.

---

## Topics Covered
- **Processor Simulation:** Simulating a RISC-V core at different abstraction levels (VHDL, SystemC).  
- **Embedded System Architecture:** Memory mapping, separate instruction/data memories, and interrupt handling.  
- **Peripherals and Interfacing:** GPIO, SPI controllers, and Flash/SRAM memory interfaces.  
- **Hardware Acceleration:** Integrating custom hardware to speed up specific tasks.  
- **Toolchains:** Using the RISC-V GNU Toolchain for cross-compilation and simulation with ModelSim.

---

## Projects

### Assignment 1: Simulation of a Tiny Embedded System
- **Goal:** Simulate a basic embedded system using the AFTAB RISC-V processor at both **Register-Transfer Level (RTL)** and **Transaction-Level Modeling (TLM)**.  
- **Description:**  
  - Wrote a simple C++ program and compiled it into RISC-V assembly and machine code using the **RISC-V GNU Toolchain**.  
  - Simulated execution on the AFTAB core in **ModelSim** using its VHDL description.  
  - Provided a low-level view of the system’s operation.
  - 
---

### Assignment 2: System Expansion with Peripherals and Interrupts
- **Goal:** Enhance the basic system by adding essential components for a real-world embedded system.  
- **Description:**  
  - **Memory Mapping:** Organized memory space with separate instruction and data memories.  
  - **Interrupt Handling:** Implemented an interrupt service routine (ISR) for external hardware interrupts.  
  - **GPIO Module:** Added a General-Purpose Input/Output interface for external signals.  
  - **Hardware Accelerator:** Integrated a custom accelerator to offload a computationally intensive task and improve execution speed.  

---

### Assignment 3: Advanced Memory and I/O Interfacing
- **Goal:** Replace simple memory modules with **industry-standard memory interfaces** and add an SPI peripheral for I/O.  
- **Description:**  
  - **SPI Flash Memory:** Replaced instruction memory with Flash, using a custom-designed SPI controller.  
  - **SRAM Data Memory:** Upgraded data memory to a 4KB **SRAM (M31HDSP200GB180W)** IP-core with a dedicated SRAM interface.  
  - **SPI Peripheral Interface:** Added an SPI I/O peripheral for off-chip communication. Designed to generate interrupts upon receiving new input, handled by the processor’s ISR.
