# UAMT

### Team members

* Mykyta Syskov (Coding, logic)
* Patrik Škeřík (Research, coding, manager)
* Zdeněk Trtík (Research, logic)

### Table of contents

* [Project objectives](#objectives)
* [Hardware description](#hardware)
* [VHDL modules description and simulations](#modules)
* [TOP module description and simulations](#top)
* [Video](#video)
* [References](#references)

<a name="objectives"></a>

## Project objectives

Code UART for nexys A7 50T and be able to send a message from one device and be able to read it on another. 

<a name="hardware"></a>

## Hardware description

[see References 3, 4](#references) <br>

used: <br>
PMOD ports JC(1) as input, JB(1) as output <br>
![](images/pmod.png)
4 digits of a 7 segment display <br>
Switches 0-7 <br>
CLK100MHZ <br>

<a name="modules"></a>

## VHDL modules description and simulations

driver_7seg_4digits <br>
clock_enable <br>
cnt_up_down <br>
hex_7seg <br>

RX (receiver)
<br>
![](images/receiver_tb.PNG)

TX (transmitter)
<br>
![](images/Transmitter_tb.PNG)

<a name="top"></a>

## TOP module description and simulations

![](images/top_tb.PNG)

<a name="video"></a>

## Video

[![Watch the video](images/video_thumb.png)](https://youtu.be/hMCPjpuThu8)

<a name="references"></a>

## References

1. [driver_7seg_4digits](https://github.com/skerikpa/digital-electronics-1/tree/main/07-display_driver)
2. [UART wikipedia](https://en.wikipedia.org/wiki/Universal_asynchronous_receiver-transmitter)
3. [Nexys A7 50T schematic](https://github.com/tomas-fryza/digital-electronics-1/blob/master/docs/nexys-a7-sch.pdf)
4. [Nexys A7 50T reference manual](https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual?redirect=1)
