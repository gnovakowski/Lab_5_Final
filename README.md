Lab 5 - Final Project
===========

https://www.youtube.com/watch?v=wZ-H2GyDuz4&feature=youtu.be

### Introduction

The goal of this lab was to correctly configure a VmodTFT touchscreen/LCD with the Digilent Atlys Spartan-6 FPGA board. This peripheral device is a full color screen that is capable of reading touch inputs and displaying video based on the touch inputs. After basic fucntionality, the goal was to use the touch screen to control the pong paddle in the pong game that was developed in Lab 2.

#### Functionality Requirements:
* Basic - Initialize touchscreen AND LCD screen to respond to touch, ie draw on screen.
* B Functionality - Control Paddle in Pong game with touch screen
* A Functionality - Add another level of complexity to pong game, ie add score display to LCD.

#### Grades:
* Prelab - On time
* Basic Functionality - Complete, on time
* B Functionality - None
* A Functionality - None

### Introduction

The goal of the laboratory exercise was to interface different peripherals of an FPGA (both the switches and the LEDs) to processors that we created, using both our written MicroBlaze and PicoBlaze processors.  

### Implementation

The implementation of this lab consisted of having to write code in OpenPicIDE for the PicoBlaze processor, and then output the code to a VHDL file for our ROM. After the ROM was created in VHDL, the UART modules were then written and instantiated in our top level file. After this, the code was then written to handle the `swt` and `led` commands in Tera Term (our chosen terminal program).

For the second part of the lab, this same functioanlity was to be implemented using MicroBlaze. The processor first had to be built using Xilinx Platform Studio. This design was then exported to SDK, where C code was written to accomplish the required functionality. The port map for my MicroBlaze processor can be seen below:

![alt text](http://i.imgur.com/veArrWW.png "MicroBlaze Port Map")


### Test/Debug

While working on this lab, I experienced issues with both of my processors. The problems I experienced can be seen below:

 * The first issue I experienced in this lab occured after I had written my PicoBlaze ROM code. I had experienced numerous issues with connecting my FPGA to the terminal. The tricky part was having to re-instanitate my ROM code in VHDL every time I made a change tot the code. I ultimately fixed this issue.
 * In the MicroBlaze portion of the lab, I also experienced issues with the initial setup of my processor design in Platform Studio. The first major issue I had was in the creation of the peripheral for the LEDs. I initally created the peripheral within the root Xilinx folder in my C: drive. After adding the peripheral to my design, this proved to not work. I was getting numerous errors during error checking. I ended up fixing this problem by removing the peripheral from my design and starting over from scratch. I re-created the peripheral in a separate folder. When i went in and added this to my design, the program ended up working without errors.
 * Another issue I had with the lab was in my creation of the constraints. After adding the peripherals to my final design, I was still getting errors with my constraints. I then realized that i never actually went in and connected the peripheral VHDL ports to external ports on the FPGA. After I did this and appropriately named my constraints for both the LEDs and the switches, my designed hardware worked well and without errors.

### Conclusion

Throughout the course of this lab, the major thing that I noticed was that although it was not as difficult as Lab 2, it was slightly more confusing in the beginning stages. The confusion stemmed from having a semi complete list of required modules, with no real direction on the order in which to instantiate them. This problem was overcome by thinking through the process carefully and appropriately deciding the placement of each of the modules. There is nothing that I would change in this lab, other than maybe assigning less points to A functionality, as it seems extremely difficult, yet carries 10% of the project grade.

 
