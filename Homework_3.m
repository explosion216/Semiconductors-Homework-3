clear;clc;
ND=1e16*ones(1,4);
NA=[1e15 1e16 2.5e17 1e18];
q=1.6e-19;
Rho_n=q*ND;
Rho_p=-q*NA;
VT=25.86e-3;
ni_sqrt=2e20;
ni=sqrt(ni_sqrt);
Fai_n=VT*log(ND./ni);
Fai_p=VT*log(ni./NA);
Fai_0=Fai_n-Fai_p;
Epsilon_Si=103.545e-14;
Em0=sqrt(2*q*Fai_0/Epsilon_Si.*(NA.*ND./(NA+ND)));
xp0=sqrt(2*Epsilon_Si*Fai_0./(q*NA).*ND./(NA+ND));
xn0=sqrt(2*Epsilon_Si*Fai_0./(q*ND).*NA./(NA+ND));
Xd0=xp0+xn0;
% xd0=sqrt(2*Epsilon_Si*Fai_0/q.*(1./NA+1./ND));
Height=0.01;
Width=0.01;
A=Height*Width;
Qj0=A*sqrt(2*Epsilon_Si*q*Fai_0.*(NA.*ND./(NA+ND)));
Cj0=A*sqrt(Epsilon_Si*q./(2*Fai_0).*(NA.*ND./(NA+ND)));

Characteristics = {'ρn(Ω cm)', 'ρp(Ω cm)', 'xp0(cm)', 'xn0(cm)', 'Xd0(cm)', 'Em0(V cm-1)', ...
                   'Φp(V)', 'Φn(V)', 'Φ0(V)', 'Qj0(C)', 'Cj0(F)'};
data = [Rho_n;Rho_p;xp0;xn0;Xd0;Em0;Fai_p;Fai_n;Fai_0;Qj0;Cj0];
T = array2table(data, 'RowNames', Characteristics, ...
                'VariableNames', {'NA=1e15 cm-3', 'NA=1e16 cm-3', 'NA=2.5e17 cm-3', 'NA=1e18 cm-3'});
disp(T);
