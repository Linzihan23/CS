***********************************************************************************************************
***********************************************************************************************************

Matlab demo code for "Image Super-Resolution reconstruction based on compressed sensing adaptive
dictionary learning algorithm" 

by£ºZihan Lin (linzihan21@stu.xjtu.edu.cn)

If you use/adapt our code in your work (either as a stand-alone tool or as a component of any algorithm),
you need to appropriately cite our paper.

This code is for academic purpose only. Not for commercial/industrial activities.

Note"
The runtimes reported in the paper are from a lab computer implementation. This Matlab version is intended 
to facilitate understanding of the algorithm. This code has not been optimized and its speed is not representative. 
The results may differ slightly from those in the paper due to cross-platform transfer.

***********************************************************************************************************
***********************************************************************************************************

Usage:

demo_main.m:Use the demo_main.m program to obtain a digital holographic reconstruction of the phase data map.

demo_Image_processing.m:Using the demo_Image_processing.m program, the image is pre-processed to obtain the LR image.

demo_test_main.m:The demo_test_main.m program was used to train compression-aware adaptive dictionary learning and to 
reconstruct super-resolution images to simulate the method proposed in this paper.

***********************************************************************************************************
***********************************************************************************************************

Evaluation index:

ENL.m is the equivalent visual number evaluation index procedure.

SSIM.m is the structural similarity index evaluation index procedure.

NC.m is the normalized correlation coefficient evaluation index program.

FeatureSIM.m is the feature similarity index subroutine evaluation index program.

***********************************************************************************************************
***********************************************************************************************************

Experimental image data:

"house.png" and "lena.png": natural images.

"phase.mat": holographic phase.

Interdigital electrode.tif: for testing and comparing experimental data graphs.