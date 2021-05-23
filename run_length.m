function [temp] = run_length(A)
%clc;
%clear all;
%A = [2,4,5,9,0,0,0,2,0,0,3,0,0,0];
out = zeros(1,length(A));
idx = 1;
flag = 0;
cnt = 0;
for i=1:1:length(A)
    
    if A(i) == 0
        flag = 1;
        cnt = cnt+1;
        
    else
        if flag==1
            out(idx) = 0;
            idx = idx+1;
            out(idx) = cnt;
            cnt = 0;
            flag = 0;
            idx = idx+1;
        end
        out(idx) = A(i);
        idx = idx+1;
    end
end
if flag == 1
    out(idx)=0;
    idx = idx+1;
    out(idx)=cnt;
    idx = idx+1;
end
temp = out(1:idx-1);
%disp(temp);
        
        