data = readtable('datosFC.csv');
% Renombro los datos 
data.Properties.VariableNames = {'time', 'ax', 'ay', 'az', 'aT'};


% Parámetros del filtro
Fs = 122.03;              % Frecuencia de muestreo en Hz
Fc_i = 1;               % Frecuencia de corte inferior [Hz]
Fc_s = 2;              % Frecuencia de corte superior [Hz]
Wn = [Fc_i Fc_s] / (Fs/2);   % Vector de Frecuencias normalizadas

% Diseño del filtro pasa banda Butterworth de 4º orden
[b, a] = butter(4, Wn, 'bandpass');

% Aplicar el filtro a la señal del eje Z (filtfilt = sin desfase)
az_filtrada = filtfilt(b, a, data.az);


% Graficar señal original
figure;
subplot(2,1,1);
% Graficar el eje Z (az) en función del tiempo
plot(data.time, data.az)
xlabel('Tiempo [s]')
ylabel('Aceleración Z [m/s^2]')
title('Aceleracion eje Z vs. Tiempo')
legend('az')
xlim([0 180])
grid on

% Graficar señal filtrada
subplot(2,1,2);
plot(data.time, az_filtrada, 'r');
xlabel('Tiempo [s]');
ylabel('Aceleración Z filtrada [m/s²]');
title('Señal filtrada pasa banda (1–2 Hz) - Latidos cardíacos');
xlim([0 180])
grid on;

