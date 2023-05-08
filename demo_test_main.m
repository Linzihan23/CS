% =========================================================================
% CS adaptive dictionary learning SR reconstructed image test code
%Environment: Win10, Matlab2020a
%Time: 2023-5-8
% =========================================================================

%% Dictionary learning parameters
clear all;
close all;
clc;

bb=8; 
RR=4; 
K=RR*bb^2; 
sigma = 25; 

%% Original image detection
IMin0=imread('house.png');
IMin0=im2double(IMin0);
figure(),imshow(IMin0,[]);

if (length(size(IMin0))>2)
    IMin0 = rgb2gray(IMin0);
end
if (max(IMin0(:))<2)
    IMin0 = IMin0*255;
end

load('IMin.mat')

%% PSNR
PSNRIn = 20*log10(255/sqrt(mean((IMin(:)-IMin0(:)).^2)));

%% Reconstructed imaging using a dictionary trained on LR images
tic
[IoutAdaptive,output] = denoiseImageKSVD(IMin,sigma,K);
toc

PSNROut = 20*log10(255/sqrt(mean((IoutAdaptive(:)-IMin0(:)).^2)));

figure;
subplot(1,3,1); imshow(IMin0,[]); title('Original image');
subplot(1,3,2); imshow(IMin,[]); title(strcat(['LR image, ',num2str(PSNRIn),'dB']));
subplot(1,3,3); imshow(IoutAdaptive,[]); title(strcat(['SR image, ',num2str(PSNROut),'dB']));

figure;
I = displayDictionaryElementsAsImage(output.D, floor(sqrt(K)), floor(size(output.D,2)/floor(sqrt(K))),bb,bb);
title('New Adaptive Dictionary');

%% Evaluation Indicators
% SSIM
sslm = SSIM(IoutAdaptive,IMin0)
% ENL
enl = ENL(IoutAdaptive)
% NC
nc2= NC(IMin0,IoutAdaptive)
% FSIM
FSIM = FeatureSIM(IMin0,IoutAdaptive)