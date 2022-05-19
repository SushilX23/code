clc;
%From the given figure,
% Highest solar radiation --> Ahmedabad (6kWh/m^2)
% Lowest solar radiation --> Sikkim (2kWh/m^2)
a =6;
b = 2;
Area_of_Ahmedabad = 464 * 10^6; %in m^2
Area_of_Sikkim = 7107 * 10^6; %in m^2
Sp = a*Area_of_Ahmedabad; %Highest Solar Potential
Ss = b*Area_of_Sikkim; % Lowest Solar Potential
fprintf('The highest solar potential is observed in Ahmedabad %5.2f kWh per day\n', Sp);
fprintf('The Lowest solar potential is observed in Sikkim %5.2f kWh per day\n', Ss);