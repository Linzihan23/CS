% =========================================================================
% Image preprocessing test code
% =========================================================================

%% Clear residual data
clear all;
close all;
clc;

%% Weakening parameters
sigma = 25; 

%% Read images and Downsampling
IMin0=double(imread('house.png'));
figure(),imshow(IMin0,[]);

% % IMin1 = imresize(IMin0,0.5,'nearest');
% % figure(),imshow(IMin1,[]);
% % IMin1 = imresize(IMin0,0.5,'bilinear');
% % figure(),imshow(IMin1,[]);
IMin1 = imresize(IMin0,0.5,'bicubic');
figure(),imshow(IMin1,[]);

%% Preprocessing
IMin3=IMin1+sigma*randn(size(IMin1));
% IMin3=awgn(IMin1,10,20);
% H = fspecial('motion',15,20);
% IMin3 = imfilter(IMin3,H,'replicate');
figure(),imshow(IMin3,[]);

% % IMin2 = imresize(IMin3,2,'nearest');
% % figure(),imshow(IMin2,[]);
% % IMin2 = imresize(IMin3,2,'bilinear');
% % figure(),imshow(IMin2,[]);
IMin2 = imresize(IMin3,2,'bicubic');
figure(),imshow(IMin2,[]);

%% Save data
IMin = IMin2;
save IMin IMin
% % figure(),imshow(IMin,[]);
% % figure(),surf(IMin);
% % shading interp;

PSNRIn = 20*log10(255/sqrt(mean((IMin(:)-IMin0(:)).^2)));

%% Evaluation indicators
% % % equivalent number of looks
% % enl = ENL(IoutAdaptive)
% % 
% % % Structure Similarity Index Measure
% % sslm = SSIM(IoutAdaptive,IMin0)
% % 
% % % normalized correlation
% % nc = NC(IMin0,IoutAdaptive)
% % 
% % % feature similarity index mersure
% % FSIM = FeatureSIM(IMin0,IoutAdaptive)
