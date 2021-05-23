%clc;
%clear all;
%A = [2,4,5,9,0,3,2,0,2,3,0,3];
function [out]= run_length_decode(A)
idx = 1;
out = zeros(1,length(A));
i = 1;
while i<=length(A)
    %disp('orig_i');
    %disp(i);
    if A(i) == 0
        num_zeros = A(i+1);
        for j=1:1:num_zeros
            out(idx) = 0;
            idx = idx+1;
        end
        i = i+1;
     %   disp('i');
      %  disp(i)
    else
        out(idx) = A(i);
        idx = idx+1;
    end
    i = i+1;
end
%disp(out);