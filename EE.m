%% Estimando Eficiências:
% Vamos usar os dados para RP = 20s, desde o momento inicial de cada
% entrada para calcularmos fatores que dependem de médias
%% Dados de Entrada:
V_in = 10; %[V]
I_in = 7.91; %[A]

P_in = V_in*I_in


%% Potência do Resistor:
R = 0.179 %[ohm]
P_r = I_in^2*R %[W]

L =  0.0455/1000 %[H]

%% Potência média do indutor:
Didt = (7.91-0)/20;
P_l = L*Didt %[W];

%% Eficiência elétrica:

eta_e = ( P_in - P_r - P_l)/P_in;

fprintf('A eficiência elétrica estimada é: %4.4f\n',eta_e);

%% Considerações:
% O Valor obtido é um pouco alto

%% Estimando eficiência mecânica:
tau = 0.091 ;%[N*m]
w = 717; %[rad/s]
P_mec = tau*w; %[W]

eta_mec = P_mec/P_in;

fprintf('A eficiência mecânica estimada é: %4.4f\n',eta_mec);

%% Conclusão:
% Os valores estão coerentes, a eficiência mecânica deve sim, por padrão,
% ser menor que a elétrica. Além disso, ambos os valores são realistas e
% condizem com os dados fornecidos pelo fabricante.




