clc; 
clear all;
Radius = 0.5*[ 52.9 71.29 82.0 101.0 82.0 78.0 82.0 87.0]; 
NominalPower = [800 2300 2000 2300 3000 3000 1500 1500 2000];
model = [ "E53/800" , "E82/2000", "E82/2300", "E101/3000", "E82/3000", "YZ78/1.5","YZ82/1.5","YZ87/2.0"];
n = 20; 
c = 10; 
b = c/(1 - (1 + c)^-n);
hub_height = 10;
for i = 1:size(Radius,2) 
 D = Radius(i); 
Area = pi*D^2;
Np = NominalPower(i);
C_blade = 0.5582*(D/2)^2 + 3.8118*(D/2)^2.5025 - 955.24;
mass_blade = 0.1452*(D/2)*2.9158;
C_hub = 4.05*mass_blade*(D/2)^2.9158 + 24141; 
C_pithsystem = 0.4802*(D)^2.6578;
C_nosecone = 103*D - 2899;
C_lowspeedshaft = 0.1*(D^2.887);
C_bearingsystem = (D^2.5)*(0.0043*D - 0.011); 
C_gearbox = 16.45*Np^1.249;
C_electronics = 79*Np; 
C_yawsystem = 0.0678*(D^2.964);
C_mainframe = 9.489*D^1.953; 
mass_mainframe = 2.233*D^1.953;
C_plaformandrailing = 1.09*mass_mainframe; 
C_hydraulicandcooling = 12*Np; 
C_electricalconnection = 40*Np; 
C_nacellecover =11.537*Np + 3849.7;
C_foundation = 303.24*(Area*hub_height)^0.4037;
C_assemblyandinstallation = 1.965*(D*hub_height)^1.1736; 
C_tower = 0.596*Area*hub_height - 2121;
C_icc = C_blade + C_hub + C_pithsystem + C_nosecone + C_lowspeedshaft + C_bearingsystem + C_gearbox + C_electronics + C_yawsystem + C_mainframe + C_plaformandrailing + C_hydraulicandcooling + C_electricalconnection + C_nacellecover + C_foundation + C_assemblyandinstallation + C_tower ;
%Total annual cost
C_tac = (b+0.025)*C_icc;
%annual electric energy output 
E_aeo = 150000 ; 
%Cost of energy 
Coe = C_tac/E_aeo; 
fprintf("\n\n For model %s\n", model(i)); 
fprintf("Initial capital cost = %f\n", C_icc); 
fprintf("Total annual cost = %f\n", C_tac);
fprintf('For annual energy output of %f kWh :\n Cost of energy($/kWh) = %f\n', E_aeo, Coe); 
end