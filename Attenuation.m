%% 
clear  
clc 
u0 = 4*pi*1e-7; % permeability air (N.A^-2)(Kg.s^-2.A^-2)
e0 = 8.854e-12; % permittivity (F.m^-1)
ur = 1.2567e-6;
er = 2.08; %permittivity Teflon
a = 1.07e-2; %m
b = 0.43e-2; %m
c = 3e8; %speed of light (m/s)
f = 15e9; %operate frequency (GHz)
tanDelta = 0.0004;
sigma= 5.8e7;% conductivity of copper (siemens/m) 

%% cut-off Frequency

m = 1; n = 0; %TE & TM mode
fcmn = (c/(2*pi*sqrt(er)))*sqrt(((m*pi/a)^2)+(n*pi/b)^2); %modes cut-off frequency

%% Attenuation of Conductor Loss and Dielectric Loss

w = 2*pi*f; %angular frequency (rad/s)
lambda = (1/sqrt(er))*(c/f); % wavelength (m)
kc = (w*sqrt(er))/c;%cut-off wave number (m^-1)
beta = sqrt((kc^2)-((pi/a)^2)); %phase constant 
rs = sqrt(w*u0/(2*sigma));% surface resistivity (ohm)
k = 2*pi/lambda; % wave number (m^-1)
n =w*ur/k; %intrinsic impedance (ohm)

AlphaC = (rs*((a^3)*(k^2)+(2*b*(pi^2))))/((a^3)*(b*beta*k*n)); % conductor loss
AlphaD = ((k^2)*tanDelta)/(2*beta); %dielectric loss
todB = 8.686; %Np/m to dB/m

fprintf(['Wavelenght = %f m \n','Wave Number = %f m^-1 \n',...
    'Intrinsic Impedance = %f ohm \r\n'],lambda,k,n);
fprintf (['The Attenuation Due to:\n','Conductor loss is = %f Np/m or %f dB/m \r',...
    'Dielectric loss is = %f Np/m or %f dB/m \r\n']...
    ,AlphaC,AlphaC*todB,AlphaD,AlphaD*todB);
%%