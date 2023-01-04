clear all
close all
clc

fold='C:\EI institute Folders\TPE-imaging optimization\New Folder (3)\Selected';

cd (fold)
img=double(imread('6-focus2_450ms.tif'));

figure(1)
imagesc(img); colormap gray
figure(2)
histogram(img(:))
BW = edge(img,'Canny');
figure(3)
imagesc(BW)
sel = strel('line',8,0);
dil_BW = imdilate(BW,sel);
figure(4)
imagesc(dil_BW)
se = strel('disk',8);
dil_BW_close = imclose(dil_BW,se);
figure(5)
imagesc(dil_BW_close)
se2 = strel('disk',30);
dil_BW_close_open=imopen(dil_BW_close,se2);
figure(6)
imagesc(dil_BW_close_open)
mask_img=img.*dil_BW_close_open;
figure(7)
imagesc(mask_img), colormap gray

fl_img=double(imread('6_12148ms.tif'));
figure(8)
imagesc(fl_img); colormap gray
mask_fl_img=fl_img.*dil_BW_close_open;
figure(9)
imagesc(mask_fl_img); colormap gray



