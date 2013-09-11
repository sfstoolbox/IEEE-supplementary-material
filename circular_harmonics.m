function M=circular_harmonics(N,phi)
L=length(phi);
M=zeros(2*N+1,L);
n=-N:N;
nmtx=repmat(n(:),1,L);
Phi=repmat(phi(:)',2*N+1,1);
idxc=nmtx>=0;
idxs=nmtx<0;
Phin=Phi.*nmtx;
M(idxc)=cos(Phin(idxc));
M(idxs)=sin(Phin(idxs));
M=M/sqrt(pi);
M(nmtx==0)=M(nmtx==0)/sqrt(2);
