clear all;
clc; SC_I = [2.469 3.33 3.175 4.9 4.76 3.696 4.68 4.45 3.93 3.53 2.51 4.6 2.08 4.05 3.23 1.78];
OC_V = [20.83 20.77 20.84 20.55 20.18 20.88 20.68 20.46 20.54 20.43 20.37 20.89 20.32 20.96 20.5 20.68]; % Open Circuit Voltage
Mes_MAX_Power= [35.39 42.72 40.72 39.61 38.7 38.8 38.18 39.52 36.62 38.2 36.42 37.96 31.15 40.67 33.7 28.22];
k1 = 0.73;
k2 = 0.85;
%Calculation
VMPP = k1*OC_V;
IMPP = k2*SC_I;
max_Power = VMPP.*IMPP;
MBE =(sum(max_Power-Mes_MAX_Power))/length(max_Power);
fprintf('The accuracy (mean bias error) is = %f\n', MBE);
fprintf('The values of factors\nk1 = %f\nk2 = %f\n', k1, k2);