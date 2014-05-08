Lab 5 - Final Project
===========

### Introduction

The goal of this lab was to correctly configure a VmodTFT touchscreen/LCD with the Digilent Atlys Spartan-6 FPGA board. This peripheral device is a full color screen that is capable of reading touch inputs and displaying video based on the touch inputs. After basic fucntionality, the goal was to use the touch screen to control the pong paddle in the pong game that was developed in Lab 2.

#### Functionality Requirements:
* Basic - Initialize touchscreen AND LCD screen to respond to touch, ie draw on screen.
* B Functionality - Control Paddle in Pong game with touch screen
* A Functionality - Add another level of complexity to pong game, ie add score display to LCD.

### Implementation
In the implementation of this lab functionality, I created my own Xilinix ISE project with the `.video` library provided by Digilint for the VmodTFT peripheral. The most difficult part of this process was the instantiation of the two separate IP cores that needed to be part of the design. These cores were provided in the `ipcore_dir` folder located in the project directory of my Lab 5 project. After figuring out the code, I was able to modify the `TFTCtl.vhd` file to allow writing on the screen in blue. After completing basic functionality, I then went on to try for B functionality, which consisted of merging my project with the pong project from Lab 2. I successfully merged the projects into one large project, but experienced issues in the generation of my `.bit` file. My `tdms_encoder.vhd` file was experiencing numerous errors with the arithmetic operands that I was unable to fix. For this reason, I was unable to proceed with B functionality.

#### Grades:
* Prelab - On time
* Basic Functionality - Complete, on time
* B Functionality - None
* A Functionality - None

A video demoing the basic functionaity of this lab exercise can be seen below. In addition to displaying lines/drawings based on touch inputs, the screen can also be adjusted/turned off by the switches on the FPGA board.

https://www.youtube.com/watch?v=wZ-H2GyDuz4&feature=youtu.be

### Test/Debug

While working on this lab, I experienced many issues while setting up my peripheral. The problems I experienced can be seen below:



### Conclusion

Throughout the course of this lab, the major thing that I noticed was that although it was not as difficult as Lab 2, it was slightly more confusing in the beginning stages. The confusion stemmed from having a semi complete list of required modules, with no real direction on the order in which to instantiate them. This problem was overcome by thinking through the process carefully and appropriately deciding the placement of each of the modules. There is nothing that I would change in this lab, other than maybe assigning less points to A functionality, as it seems extremely difficult, yet carries 10% of the project grade.

 
