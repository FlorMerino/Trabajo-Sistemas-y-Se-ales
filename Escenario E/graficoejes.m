data = readtable('datosFC.csv');
% Renombro los datos 
data.Properties.VariableNames = {'time', 'ax', 'ay', 'az', 'aT'};


% Graficar el eje Z (az) en función del tiempo
plot(data.time, data.az)
xlabel('Tiempo [s]')
ylabel('Aceleración Z [m/s^2]')
title('Aceleracion eje Z vs. Tiempo')
legend('az')
xlim([0 180])
grid on