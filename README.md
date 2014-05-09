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
* The first major issue I experienced was in my inital design of the project for the VmodTFT. As I was adding the provided required video library, I had to instantiate two separate IP cores as they were provided in the `ipcore_dir` project directory. There were many issues in the design when I attempted to parse it. After a while, after regenerating the cores in my design, I was able to parse the design without any issues. 
* The next major issue I experienced was in the initialziation of the LCD display. I could get a response out of the touch screen which could be seen by the LEDs on the FPGA board, but I could not figure out how to actually activate the screen. After delving deeper into the code and referencing example code provided by Digilent, I was eventually able to not only get the LCD display to turn on, but I could get it to display colors.
* The next and biggest issue I experienced was after I had completed the basic functionality and was attempting to merge my project with the pong game project from Lab 2. To the best of my knowledge, I had successfully merged the two projects with a common top shell file. I made especially sure that none of my inputs, outputs, or signals were named the same across the project, but I still experienced a significant issue. For some reason, with the new design, I was getting errors with my TDMS encoder. I was getting errors that for some reason, it did not like my arithmetic signals that were fine when used in Lab 2 (ie `+`, `-`, `>`). I was unable to solve this issue, and so I ended up not being able to complete B or A functionality.  


### Conclusion

Throughout the course of this lab, I learned how to sufficiently intereface my FPGA with peripheral modules designed for the Atlys FPGA board. Despite encountering numerous issues/errors, I was, for the most part, able to overcome them to complete at least basic functionality, I felt that previous lab exercises in this class had adequately prepared me to complete this project.
