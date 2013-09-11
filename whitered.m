function m = whitered(n)

if nargin < 1
   n = size(get(gcf,'colormap'),1);
end

m_table = [127,0,0
238,0,0
255,112,0
255,238,0
255,255,255];

m = zeros(n,3);
for ii=1:n
    for jj=1:3
        m(ii,jj)=interp1(linspace(1,n,size(m_table,1)),m_table(:,jj),ii);
    end
end
m = m/256;
