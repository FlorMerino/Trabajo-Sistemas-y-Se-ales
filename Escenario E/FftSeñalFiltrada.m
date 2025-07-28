clear
data = readtable('datosFC.csv');
% Renombro los datos 
data.Properties.VariableNames = {'time', 'ax', 'ay', 'az', 'aT'};


% Parámetros del filtro
Fs = 122.03;              % Frecuencia de muestreo en Hz
Fc_low = 1;               % Frecuencia de corte inferior [Hz]
Fc_high = 2;              % Frecuencia de corte superior [Hz]
Wn = [Fc_low Fc_high] / (Fs/2);   % Vector de Frecuencias normalizadas

% Diseño del filtro pasa banda Butterworth de 4º orden
[b, a] = butter(4, Wn, 'bandpass');

% Aplicar el filtro a la señal del eje Z (filtfilt = sin desfase)
az_filtrada = filtfilt(b, a, data.az);

% -----------------------------
% FFT de la señal filtrada


% Número de muestras
N = length(az_filtrada);

% Aplicar FFT
Y = fft(az_filtrada);

% Obtencion del modulo al realizar la FFT
Y = abs(Y/N);
Y = Y(1:floor(N/2));  

% Vector de frecuencias correspondiente
f = (0:floor(N/2)-1) * Fs / N;

% Graficar espectro
figure;
plot(f, Y, 'LineWidth', 1.5);
xlim([0 5]); % Mostrar solo hasta 5 Hz para enfocarse en respiración y latidos
xlabel('Frecuencia [Hz]');
ylabel('Magnitud');
title('Espectro de la señal filtrada (FFT)');
grid on;