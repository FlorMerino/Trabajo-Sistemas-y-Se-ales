data = readtable('datosSentadillas.csv');
% Renombro los datos 
data.Properties.VariableNames = {'time', 'ax', 'ay', 'az', 'aT'};


dt = mean(diff(data.time));  % Diferencia promedio entre muestras
fs = 1 / dt;                 % Frecuencia de muestreo
fprintf('Frecuencia de muestreo: %.2f Hz\n', fs);