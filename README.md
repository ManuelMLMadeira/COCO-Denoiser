# COCO Denoiser - Code

We provide code both for **Matlab** and **Python**. Python is used to run the experiments in the Logistic Regression task (Figure 5). Matlab is used for the rest.

---

## Matlab Folder:

- In this folder, we have 6 sub-folders where the code is used to obtain different plots. Inside each folder, if you want to only obtain the plots in the paper, you just need to run the PlottingResults.m script (except in the Constraints Tightness Probabilities, where it is enough to run the Main.m script; in the Warm-starting, where it is enough to run the Testing.m and in the MSEvsDistance, where the .mat file due to its size). Whenever you plot those results, the generated figures are stored as .pdf in the same folder. Note that the PlottingResults.m plots the results generated by Main.m, which are stored as .mat files.
- Across the sub-folders there are some common functions: 
  - *vecnorm_local.m* or *vecnorm.m* - vectorwise norm of a matrix, along dimension d
  - *FDPG.m* - runs the Fast Dual Proximal Gradient method
  - *DualFunctionEval.m* - auxiliary function to FDPG.m, allows to Evaluate the Dual Function for a given s (dual variable).
  - *quad_func* - for a given x, computes $0.5 x^T A  x - b^T x$ (which is the objective function).
  - *COCO_Denoiser* - Runs the proposed COCO Denoiser method, which allows the denoising of the oracle gradient estimates.

#### SUB-FOLDERS:
- **Constraints Tightness Probabilities**: run *Main.m* to reproduce the results in Figures 7 and 8

- **MSE for each point**: run *Main.m* to generate *results1.mat* (tighter box), *results2.mat* (intermediate box), *results3.mat* (looser box). With *PlottingResults.m*, the results from Figures 2, 10 and 11 (for this last one, note that the file loaded must be results2.mat) are generated.

- **MSEvsDistance**: run *Main.m* to generate *results2.mat*. With *PlottingResults.m*, the *results2.mat* is used to generate Figures 9 and 12. *isActiveConstraint.m* outputs 0 if a co-coercivity constraint is verified and 0 otherwise.

- **MSEvsVariance in Box10**: *polyfix.m* fits polynomial p to data, but specify value at specific points (used to fix the intercept to 0). Inside each folder (SGD and Co-coercivity) the data is generated and stored as .mat. These variables are used with PlottingResults.m to generate Figure 3.

- **Synthetic Dataset**: again, inside each folder, the data is generated and stored as .mat. These variables are used with PlottingResults.m to generate Figures 4, 13 and 14. 

- **Warm-starting**: run *Testing.m* to generate Figure 6. From the 10th to the 11th gradient step of a first-order method, the dual function evolution in FDPG is recorded when using or not the warm-starting procedure.

---

## Python Folder:

- *fourclass* and *mushrooms* are the two dataset considered.
- *Streaming Stochastic Fourclass.ipynb* and *Streaming Stochastic Mushrooms.ipynb* are two Jupiter notebooks which run the algorithms and provide the plots required to obtain Figure 5.
- *stochastic_methods.py* is where the different algorithms considered are stored.
- *logisitic_linear.py* allows to build the logistic regression problem from the design matrix and labels.
