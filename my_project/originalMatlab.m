clc
clearvars
close all

%% LOAD THE WAVE DATA
wave = load('Islandsberg%7D2015-12-24T00h00A.1rw'); % load the wave data
wave = wave/100; % from cm to m
wave = wave - mean(wave);

L = length(wave);   % number of sampling points
Fs = 2.56;          % sampling frequency [Hz]
dt = 1/Fs;          % sampling time step [s]
t = dt:dt:L*dt;     % time vector [s]

%% COMPUTE THE SPECTRAL DENSITY FUNCTION
z = fft(wave)/L;    % complex amplitudes
df = 1/(L*dt);      % frequency step [Hz]
Nyf = length(z)/2;  % cut off the mirror frequency
f = df:df:Nyf*df;   % frequency vector [Hz]
S = 2*(z(1:Nyf)).*conj(z(1:Nyf))/df;    % spectral density

%% COMPUTE THE SPECTRAL MOMENTS AND WAVE PARAMETERS
mzero = trapz(f,S);     % spectral moment m_0 [m^2] % trapezoidal numerical integration
mmone = trapz(f,S./f'); % spectral moment m_{-1} [m^2 s]
mone = trapz(f,S.*f');  % spectral moment m_{1} [m^2/s]
mtwo = trapz(f,S.*(f.^2)');     % spectral moment m_{2} [m^2/s^2]
mfour = trapz(f,S.*(f.^4)');     % spectral moment m_{4} [m^2/s^4]

Hm0 = 4*sqrt(mzero);    % significant wave height [m]
Te = mmone/mzero;       % energy period [s]
Tavg = mzero/mone;      % average period [s]
Tz = sqrt(mzero/mtwo);  % average up-crossing period [s]
epsilon = sqrt(1-mtwo^2/mzero/mfour);   % bandwidth parameter

fm = f(find(S==max(S))); % peak (modal) frequency [Hz]
Tm = 1/fm;               % peak (modal) period [s]
Tp = sqrt(mtwo/mfour);

rho = 1025;                 % salty water density [kg/m^3]
g =9.81;                    % gravity
J = rho*g^2/64/pi*Te*Hm0^2; % energy flux [W/m]
J = J*1e-3;                 % energy flux [kW/m]  

%% SAVE THE RESULTS AND PLOT SPECTRUM
resultWaveData = zeros(8,1);    % initialization of the results variable
resultWaveData(1) = Hm0;
resultWaveData(2) = Te;
resultWaveData(3) = Tz;
resultWaveData(4) = Tp;
resultWaveData(5) = Tavg;
resultWaveData(6) = Tm;
resultWaveData(7) = epsilon;
resultWaveData(8) = J;
save(sprintf('resultsWaveData.txt'),'resultWaveData','-ascii');

fig1 = figure(1);
plot(f,S)
hold on
scatter(fm,max(S),'r*')
axis([0 0.5 0 50])
xlabel('Frequency [Hz]')
ylabel('Spectral density [m^2 s]')
figname = sprintf('spectrumWaveData.pdf');
saveas(fig1,figname,'pdf');










