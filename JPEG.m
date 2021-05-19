clc;
clear all;
I=imread('me.jpg'); %initial image
T = I;  %backup of image
I=rgb2gray(I);
subplot(1,2,1);
imshow(I);
title('Original Image')
I=double(I);
[size1,size2]=size(I);
if(mod(size1,8)==0)
    Ia=size1-8; %(24-8) = 16
else
    Ia=size1-(8+mod(size1,8)); %23-(8+7) = 8
end
if(mod(size2,8)==0)
    Ib=size2-8;
else
    Ib=size2-(8+mod(size2,8));
end

D_C=DST(I,1,Ia,Ib);
Q=quantise(D_C,1,Ia,Ib);
Z=zig_zag(Q,1,Ia,Ib);
    
A2=[];
P2=[];

disp('This loop will run till the iteration value reaches')
disp(Ia*Ib/64);

for i=1:1:Ia*Ib/64
    a=length(A2);
    A2=encode(Z(i,:),A2);
    P2=decode(A2,P2,a+1,i);
    disp(i);
end

J=zig_zag(P2,2,Ia,Ib);
J=quantise(J,2,Ia,Ib);
I2=DST(J,2,Ia,Ib);
I2=uint8(I2);
I=uint8(I); %final image on decoding
subplot(1,2,2)
imshow(I);
title('Image after decoding');