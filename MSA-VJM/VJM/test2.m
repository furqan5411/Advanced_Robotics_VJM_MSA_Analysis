clear all
L=300e-3;
l=100e-3;
d=300e-3;

% temp = HOWTO(0,0.3,true);
q = HOWTO(0,0.2,0.2);
Tbase = eye(4);
Ttool = eye(4);
t = zeros(1,13);

% q0 = [-temp(1,2) -temp(1,1)];
% q2 = temp(1,3)-temp(1,1);
% q1 = temp(1,4)-temp(1,2);
% q3 = pi*3 - temp(1,1) - temp(1,2) - q1- q2;
% q = [-q1 -q2 q3];
F = [100;0;0;0;0;0];

k0 = 1e6; % Actuator stif
%LINK1
%material and shape parameters
E_1 = 70 *10e9; %Young's modulus
G_1 = 25.5*10e9; %shear modulus
d_1 = 10*10e-3;
L_1 = L;

%for cylinder
S_1 = pi*d_1^2/4;
Iy_1 = pi*d_1^4/64;
Iz_1 = pi*d_1^4/64;
J_1 = Iy_1 + Iz_1;


k1 = [E_1*S_1/L_1 0                  0                 0           0                 0;
    0           12*E_1*Iz_1/L_1^3  0                 0           0                 6*E_1*Iy_1/L_1^2;
    0           0                  12*E_1*Iy_1/L_1^3 0           -6*E_1*Iy_1/L_1^2 0;
    0           0                  0                 G_1*J_1/L_1 0                 0;
    0           0                  -6*E_1*Iy_1/L_1^2 0           4*E_1*Iy_1/L_1      0;
    0           6*E_1*Iy_1/L_1^2   0                 0           0                 4*E_1*Iz_1/L_1];




%LINK2
%material and shape parameters
E_2 = 70 *10e9; %Young's modulus
G_2 = 25.5*10e9; %shear modulus
d_2 = 10*10e-3;
L_2 = l;

%for cylinder
S_2 = pi*d_2^2/4;
Iy_2 = pi*d_2^4/64;
Iz_2 = pi*d_2^4/64;
J_2 = Iy_2 + Iz_2;


k2 = [E_2*S_2/L_2 0                  0                 0           0                 0;
    0           12*E_2*Iz_2/L_2^3  0                 0           0                 6*E_2*Iy_2/L_2^2;
    0           0                  12*E_2*Iy_2/L_2^3 0           -6*E_2*Iy_2/L_2^2 0;
    0           0                  0                 G_2*J_2/L_2 0                 0;
    0           0                  -6*E_2*Iy_2/L_2^2 0           4*E_2*Iy_2/L_2      0;
    0           6*E_2*Iy_2/L_2^2   0                 0           0                 4*E_2*Iz_2/L_2];


% K theta matrixshow
Kt = [k0 zeros(1,12)
    zeros(6,1) k1 zeros(6,6)
    zeros(6,1) zeros(6,6) k2];

Jq=Jq_1(Tbase,Ttool,q,t,L,l);
Jt=Jt_1(Tbase,Ttool,q,t,L,l);

Kc0=inv(Jt*inv(Kt)*Jt');
Kc_1 = Kc0 - Kc0*Jq*inv(Jq'*Kc0*Jq)*Jq'*Kc0

Jq=Jq_2(Tbase,Ttool,q,t,L,l);
Jt=Jt_2(Tbase,Ttool,q,t,L,l);

% Analytical solution
Kc0=inv(Jt*inv(Kt)*Jt');
Kc_2 = Kc0 - Kc0*Jq*inv(Jq'*Kc0*Jq)*Jq'*Kc0

Jq=Jq_3(Tbase,Ttool,q,t,L,l);
Jt=Jt_3(Tbase,Ttool,q,t,L,l);

Kc0=inv(Jt*inv(Kt)*Jt');
Kc_3 = Kc0 - Kc0*Jq*inv(Jq'*Kc0*Jq)*Jq'*Kc0

