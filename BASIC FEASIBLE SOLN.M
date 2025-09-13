%  Find all basic feasible solutions for the following system of equations 
% x1+x2+x3=5
%2z1+x2+x4x3=11
%x1,x2,x3>=0
 clc; clear;
A=[1 1  1;
   2 1  4];
b=[5 ; 11]; 
x= zeros(3,1);
fprintf('basic feasible solutions:\n');
%case 1: x1,x2 are basic ,x3=0
x(3)=0;
x([1,2])=A([:,1:2])\b;
if all( x>=0) 
    fprintf('[%g %g %g]\n',x(1),x(2),x(3));
end
%case 2: x1,x3 are basic ,x2=0
x(2)=0;     
x([1,3])=A([:,1,3])\b;
if all( x>=0) 
    fprintf('[%g %g %g]\n',x(1),x(2),x(3));
end
%case 3: x2,x3 are basic ,x1=0
x(1)=0; 
x([2,3])=A([:,2,3])\b;
if all( x>=0)   
    fprintf('[%g %g %g]\n',x(1),x(2),x(3));
end  

