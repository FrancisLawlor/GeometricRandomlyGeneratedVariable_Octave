function x = generate_geom(p,m)
% GENERATE_GEOM - generate_geom(p) outcomes m times 
%   

u=rand(1,m);                      % 1 x m vector of uniform pseudorandom numbers between 0 and 1

x=floor(log(u) / log(1 - p));     % invert cdf

% plot histogram of outcomes

close all;                        % close all previous plots

%dx=(b-a)/(m/50);
a=1;
b=200;   
dx=(b-a)/(m/50);                  % discretization step (dx)
alphabet_x=[a+dx/2:dx:b-dx/2];    % discretized alphabet of r.v. using dx
hx=hist(x,alphabet_x);            % histogram of x on bins defined by alphabet_x
bar(alphabet_x,hx/sum(hx)/dx);    % bar plot of normalised histogram of x
hold on;                          % keep this plot while plotting next

fx=ones(1,length(alphabet_x));    % 1 x m vector of ones for storing pmf outcomes
for j=1:length(alphabet_x)      
  fx(j)=((1-p)^(j-1))*p;          % apply pmf with number of trials incrementing
end

plot(alphabet_x,fx,'r');          % plot pmf

legend('empirical','theoretical') % add legend to figure