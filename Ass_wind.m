clc; 
clear all;
v1 = [3.8 4.1 4.7 5.6 7.5 7.5 7.4 6.4 5.5 3.29 3.5 3.7]; % wind speed at h1 hight 
h1 = 10;  
h2 = 0; 
i= 1:15	
h2 = h2+10;
b(i) = h2;
alpha = 0.143; % Power cofficient	
v2 = v1.*((h2/h1)^alpha);
CF = (sum(v2.^3)/length(v2))/(sum(v2)/length(v2))^3; %Cubic factor	
k = 1 + (3.69/CF^2); % Shape parameter 
c = (sum(v2)/length(v2))/gamma(1+(1/k));
row = 1.21;
Pw(i) = 0.5*row*c^3*gamma(1+(3/k)); % Wind power density 
for i=1:15	
    fprintf('The mean Wind Power Density (WPD) = %.3f\n ' , Pw(i));	
    if(50<Pw(i) && Pw(i)<=200)
disp('Poor wind capacity') 
    elseif(200<Pw(i)&&Pw(i)<=300)
disp('marginal wind capacity') 
    elseif(300<Pw(i)	&& Pw(i)<=400)
disp('Moderate wind capacity') 
    elseif(400<Pw(i)&&Pw(i)<=500)	
        disp('Good wind	capacity')
elseif(500<Pw(i)&&Pw(i)<=600)
disp('Excellent wind capacity') 
    elseif(600<Pw(i)&&Pw(i)<=800)
disp('Excellent wind capacity')
    elseif(Pw(i)>800) 
        disp('Excellent wind capacity')
    end 
end
% Plot between height and Power density 
plot(b,Pw)
xlabel('Height') 
ylabel('Power Density')


