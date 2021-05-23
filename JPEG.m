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

[z_rows,z_cols] = size(Z); 
Z = reshape(Z,[1,(z_rows*z_cols)]);
[z_temp_row,z_temp_col] = size(Z);

encoded_msg = run_length(Z);

[en_msg_row,en_msg_col] = size(encoded_msg);
disp('compression ratio')
disp(en_msg_col/z_temp_col);

decoded_msg = run_length_decode(encoded_msg);
decoded_msg = reshape(decoded_msg,[z_rows,z_cols]);

J=zig_zag(decoded_msg,2,Ia,Ib);
J=quantise(J,2,Ia,Ib);
I2=DST(J,2,Ia,Ib);
I2=uint8(I2);
I=uint8(I); %final image on decoding
subplot(1,2,2)
imshow(I);
title('Image after decoding');