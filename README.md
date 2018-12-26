# Cellular-System-Loss-Probability
Matlab

The code calculates and plot the Loss Probability Curve of a cellular system that only supports one service (voice), with each session requiring 1 resource unit. The system has 5 resource units, and reserves one resource unit for handoff. 

Assuming Poisson Arrival Process for new and handoff requests. 

Two types are considered in the code:

 Type I: reserved resources are not fixed resources.
 Type II: reserved resources are fixed. 
 
 The Code: 
1. Main script that executes two functions (Type1 and Type2) and extracts the loss probabilities from output of the functions and generates the plots
2. Type1.m and Type2.m functions creates the matrices for Type1 and 2 using nested loops and obvious patterns. Then calculates the state probabilities and stores it in a vector to be returned to the main script.
3. Comments are included in the MATLAB files in greater details.
