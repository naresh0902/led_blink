# 🔦 Basys 3 LED Blink at 1Hz

This project demonstrates how to blink the onboard LED of the **Digilent Basys 3 FPGA** at 1Hz using **Verilog**. It uses a clock divider module to generate a 1Hz clock from the 100MHz system clock, which then toggles the LED state every second.

---

## 📋 What You’ll Learn
- Dividing a high-frequency clock (100MHz) down to a low-frequency clock (1Hz)
- Writing modular Verilog code with separate modules
- Using Vivado for synthesis, implementation, and programming
- Mapping FPGA pins via an `.xdc` constraints file

---

## 🛠️ Hardware & Software Required
- **Digilent Basys 3 FPGA Board** (Artix-7)
- **Xilinx Vivado Design Suite** (WebPACK edition is free)
- USB cable to program the FPGA

---

## 📂 Project Files

| File           | Description                            |
| -------------- | ----------------------------------   |
| `clk_1hz.v`    | Clock divider module (100MHz → 1Hz)  |
| `led_blink.v`  | Top module that toggles LED at 1Hz   |
| `schematic.png`| Schematics of led_blink.v            |
| `Implementation.mp4`| Implementation on basys3            |

---

## ⚙️ How It Works

1. **Clock Divider (`clk_1hz.v`)**  
   Counts 50 million clock cycles of the 100MHz input, then toggles the output clock, generating a 1Hz clock signal.

2. **LED Blink Module (`led_blink.v`)**  
   Uses the 1Hz clock to toggle the onboard LED, blinking it once per second.

---

## 🎯 Pin Constraints (`led_blink.xdc`)

Make sure your constraints match the top module port names:

```xdc
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

set_property PACKAGE_PIN U16 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]
