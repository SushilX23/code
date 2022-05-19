clear all;
clc;
L = 8.28; %latitude of Minicoy Islands
I_sc = 1367 ; %solar constant n = [17 35 64 93 137 155 197 224 265 298 315 333]; %days of the year
H = [4.93 5.61 6.05 5.93 5.05 4.29 4.58 4.88 5.09 5 4.63 4.6]; %monthly average daily global raidation
delta = 23.45*sind(360*(n+284)/365); %solar declination angle
Ws = acos(-tand(L).*tand(delta)); %mean sunrise hour angle
S_0 = 2*Ws/15; %Monthly average daily duration of sunshine
%Monthly average daily maximum duration of bright sunshine
S = [5.36 5.83 5.86 5.77 5.48 4.56 4.23 4.77 4.67 5.39 5.59 5.37];
Ho = (24/pi)*I_sc*(1+ 0.033*cosd(360*n/365)).*(cosd(L)*cosd(delta).*sin(Ws) + Ws*sind(L).*sind(delta)); %monthly average daily extra-terrestrial radiation
A = H./Ho;
B = S./S_0;
X = sum(A);
Y = sum(B);
Z = sum(A.*A);
W = sum(A.*B);
N= 12 ; %for 12 months
M = [N Y ; X W];
N = [X ; Z];
ans = inv(M)*N;
a = ans(1);
b = ans(2);
fprintf("The calculated solar panel coefficients are:\na = %0.4e\nb =%0.5f\n", a, b)