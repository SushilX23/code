clc
clear all;
close all;
Pm=[35.39 42.72 40.72 39.61 38.7 38.8 38.18 36.42 37.42 31.5 40.67 33.7 28.22];
Voc=[20.83 20.77 20.84 20.55 20.18 20.68 20.46 20.54 20.43 20.37 20.32 20.92 20.5];
Isc=[2.46 3.33 3.175 4.9 4.76 3.696 4.68 4.45 3.98 3.53 2.51 4.6 2.08];
FF=Pm/(Voc.*Isc)
FFS=(17.86*4.19)/(21.89*4.48)
NFF=FF/FFS;
if FF<FFS
fprintf('module is degrade\n');
else
fprintf('module is not degrade\n');
end