% GSA code v1.1.
% Generated by Esmat Rashedi, 2010.
% " E. Rashedi, H. Nezamabadi-pour and S. Saryazdi,
%�GSA: A Gravitational Search Algorithm�, Information sciences, vol. 179,
%no. 13, pp. 2232-2248, 2009."
%
%This function initializes the position of the agents in the search space, randomly.
function [X]=initialization(dim,N,up,down)

if size(up,2)==1
    X=rand(N,dim).*(up-down)+down;
end
if size(up,2)>1
    for i=1:dim
    high=up(i);
    low=down(i);
    X(:,i)=rand(N,1).*(high-low)+low;
  end
end
