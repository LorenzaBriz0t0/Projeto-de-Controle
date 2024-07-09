clc
clear
close all
%% Vamos começar definindo todas as variáveis para a montagem do modelo em espaços de estados:
% Vamos fazer primeiro com os dados do tutorial, e depois, vamos comparar
% os gráficos

R = 0.179;  % [ohm] -> Resistência
L = 0.0456;  % [mH] -> Indutância
J = 35.1;  % [g/cm^2] -> Inércia de Rotação do Rotor
c = 11.9;  % [rpm/mNm] -> Coeficiente de Fricção do Rotor
kt = 12;  % [mNm/A] -> Constante de Torque 
kv = 797; % [rpm/V] -> Constante de Velocidade
ke = 1/kv; 

%% Montagem da Matriz de estados:

A = [-R/L -ke/L;
    kt/J   -c/J];

%% Montagem da Matriz de Entradas:

B = [1/L 0;
     0 -1/J];

%% Montagem da Matriz de Saída:

C = [1 0;
     0 1];

%% Montagem da Matriz de Transferência Direta:

D = zeros;

%% Utilizando o Space-State do Matlab:

model = ss(A,B,C,D);

%% Entradas-degrau de Tensão para eixo girante sem torque externo (Livre) e Condição Nominal para maior potência:

%% Va - Tensão na Armadura
% Criação de Vetor -> Entrada de 10 V em t= 0s

Va = 10*ones(10000,1);

%% tau - Torque externo
% Vamos escrever a configuração de uma entrada degrau em t = 10s:

tau= 0.091*([zeros(5000,1) ...
    ;ones(5000,1)]);

%% Definindo a discretização do tempo
% Incrementos de 20
 
time = linspace(0,20,10000);

%% Vamos escolher as cores dos gráficos:

cor1 = input('Escolha uma cor:\n','s');
cor2 = input('Escolha mais um cor:\n','s');
cor3 = input('Escolha uma terceira cor:\n','s');

%% Plotando Va x t:

tiledlayout(2,1)
ax1 = nexttile;

plot(ax1,time, Va,'LineWidth',2, 'Color',cor1);
hold on % Vamos usar isso depois

%% Ajustes estéticos de gráfico:

set(gca,'FontSize',14)
grid on
grid minor
xlabel(' Time $[s]$','Interpreter','latex');
ylabel('$V_a [V]$ ','Interpreter','latex');

%% Plotando tau x t:

ax2 = nexttile;
plot(ax2,time,tau,'LineWidth',2,'Color',cor2);

hold on

set(gca,'FontSize',14)
grid on
grid minor
xlabel(' Time $[s]$','Interpreter','latex');
ylabel('$\tau [Nm]$','Interpreter','latex');

%% Encontrando a Resposta do Sistema:
% Utilizando o lsim, conseguimos obter a resposta do modelo de sistema dinâmico para
% as entradas desejadas.

figure
lsim(model,[Va tau], time,cor3)
set(findall(gcf,'type','line'),'Linewidth',2);
set(gca,'FontSize',14)
grid on
hold on

%% Vamos agora usar os dados do fornecedor e compará-los com o do tutorial, usando exatamente o mesmo procedimento:
% Vamos fazer isso para ver se nossa simulação gera valores coerentes, de
% mesma ordem de grandeza, pelo menos

R1 = 0.179  % [ohm] -> Resistência
L1 =  0.0455/1000;  % [H] -> Indutância
J1 = 35.1/10000000;  % [kg/m^2] -> Inércia de Rotação do Rotor
c1 = 5.4096/1000000;  % [rad/Nm] -> Coeficiente de Fricção do Rotor
kt1 = 12/1000;  % [Nm/A] -> Constante de Torque 
kv1 = 83.5; % [rad/s/V] -> Constante de Velocidade
ke1 = 1/kv1; 

A1 = [-R1/L1 -ke1/L1;
    kt1/J1   -c1/J1];

B1 = [1/L1 0;
     0 -1/J1];

C1 = [1 0;
     0 1];

D1 = zeros;

model1 = ss(A1,B1,C1,D1)

Va1 = 10*ones(10000,1);

tau1 = 0.091*([zeros(5000,1);ones(5000,1)]);

time1 = linspace(0,20,10000);

cor4 = input('Digite uma cor:\n','s');

figure(2)
lsim(model1,[Va1 tau1], time1,cor4)
legend('Fornecedor','Correção de Unidades')
set(findall(gcf,'type','line'),'Linewidth',2);




















