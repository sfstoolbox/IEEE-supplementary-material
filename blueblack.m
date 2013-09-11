function m = blueblack(n)

if nargin < 1
   n = size(get(gcf,'colormap'),1);
end

m_table = [0,50,84
0,153,255];

m = zeros(n,3);
for ii=1:n
    for jj=1:3
        m(ii,jj)=interp1(linspace(1,n,size(m_table,1)),m_table(:,jj),ii);
    end
end
m = m/256;
