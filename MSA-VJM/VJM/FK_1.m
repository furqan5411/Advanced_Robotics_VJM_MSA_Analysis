 function [T]=FK_1(Tbase,Ttool,q,t,L,l)
T=Tbase*Tx(l)*Ty(l)*Tz(q(1))*Tz(t(1))*Rz(q(2))*Tx(L)*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(3))*Tx(L)...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))...
    *Rz(q(4))*Ttool;