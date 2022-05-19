clear all;
clc;
L = 8.28; %
I_sc = 1367 ; %solar constant n = [29 23 64 93 137 155 197 224 265 298 315 333];
delta = 23.45*sin(2*pi*(n+284)/365); %solar declination angle
W = acos(-tand(L).*tand(delta));% sunrise hour angle
S_0 = 2.*W./15; %monthly average day length
H_g = [4.93 5.61 6.05 5.93 5.05 4.44 4.58 4.88 5.09 5 4.63 4.6]; %monthly average daily global raidation
H_0 = (24/pi).*S_0.*(1+ 0.033.*cosd(360.*n/365)); Kt = H_0./H_g;
fprintf("The value of Kt is :\n");
disp(Kt');
for i = 1:12
if W(i) < 81.4*pi/180
H_d(i) = H_g(i)*(1.391 - 3.560*Kt(i) +4.189*Kt(i)^2 - 2.137*kt(i)^3);
else
H_d(i) = H_g(i)*(1.311 - 3.022*Kt(i) + 3.427*Kt(i)^2+ 1.821*Kt(i)^3);
end
end
rho = 0.16;
for i = 1:12
max = 0;
j = 1;
for beta = 0:90
Wss = min(acosd(-tand(L).*tand(delta(i)) ), acosd(tan(L+beta).*tand(delta(i))));
Rb = (cosd(L - beta).*cosd(delta(i)).*sind(Wss) + Wss.*sind(L- beta).*sind(delta(i)))./(cosd(L).*cosd(delta(i)).*sind(Wss) + (Wss*pi/180).*sind(delta(i)).*sind(L));
H_t(j) = (H_g(i) - H_d(i))*Rb + H_g(i)*rho*(1-cosd(beta))/2 + H_d(i)*(1+cosd(beta))/2;
j = j+1;
end
for j = 1:91
if (H_t(j)) > max max = H_t(j); maxind = j; H_tmax(i) = max; end
end
beta_opt(i) = maxind - 1;
end
fprintf("The calculated maximum Ht :\n");
disp(H_tmax);
fprintf(" Calculated Beta optimum:\n");
disp(beta_opt);