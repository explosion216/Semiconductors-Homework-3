# Semiconductors Homework 3
 Semiconductors Homework 3
希望各位借鉴的同学都能Star、Fork或者Watch一下，谢谢！

## Result

| Characteristic  | NA=1e15 cm⁻³    | NA=1e16 cm⁻³    | NA=2.5e17 cm⁻³  | NA=1e18 cm⁻³    |
|-----------------|-----------------|-----------------|-----------------|-----------------|
| ρn(Ω cm)        | 0.0016          | 0.0016          | 0.0016          | 0.0016          |
| ρp(Ω cm)        | -0.00016        | -0.0016         | -0.04           | -0.16           |
| xp₀ (cm)        | 8.658e-05       | 2.1232e-05      | 1.2461e-06      | 3.2331e-07      |
| xn₀ (cm)        | 8.658e-06       | 2.1232e-05      | 3.1154e-05      | 3.2331e-05      |
| Xd₀ (cm)        | 9.5238e-05      | 4.2465e-05      | 3.24e-05        | 3.2655e-05      |
| Em₀ (V cm⁻¹)    | 13378           | 32089           | 48139           | 49959           |
| Φp (V)          | -0.28876        | -0.34831        | -0.43155        | -0.4674         |
| Φn (V)          | 0.34831         | 0.34831         | 0.34831         | 0.34831         |
| Φ₀ (V)          | 0.63707         | 0.69661         | 0.77985         | 0.8157          |
| Qj₀ (C)         | 1.3853e-12      | 3.3972e-12      | 4.9846e-12      | 5.173e-12       |
| Cj₀ (F)         | 1.0872e-12      | 2.4384e-12      | 3.1958e-12      | 3.1709e-12      |


## MATLAB source code
```
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
```