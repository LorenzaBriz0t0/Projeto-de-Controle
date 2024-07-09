# Modelagem de Motor Elétrico DC
## Overview
---

O objetivo do projeto é a modelagem de um motor elétrico de corrente contínua, através da implementação computacional das equações que descrevem seu comportamento. Além disso, deseja-se determinar as constantes necessárias para a aplicação do modelo e comparar os resultados obtidos com as especificações do produto utilizado como base.

## Descrição do Sistema
---

Para isso, é necessário compreender o funcionamento do motor e a atuação de cada elemento. Quando uma tensão é aplicada, o circuito gera uma corrente, a qual relaciona-se de forma diretamente proporcional com o torque do sistema, que por sua vez age aumentando a velocidade de rotação. Desta maneira, conforme o rotor acelera, uma força contra-eletromotriz é gerada e se opõe a tensão aplicada. Eventualmente, o equilíbrio dinâmico é atingido, ou seja as contribuições positivas e negativas de tensão tornam-se comparáveis. Por fim, o torque gerado deve balancear o torque de carga, de modo a determinar a velocidade final durante a operação do motor. A figura a seguir ilustra o sistema descrito:

![Imagem Ilustrativa do Circuito de Motor Elétrico de Armadaura:](https://i.ibb.co/4wqspK3/Circuito-DC.png)


## Equacionamento:

Primeiramente, aplica-se a Lei de Kirchhoff ao circuito apresentada na Figura 1, de modo a garantir que a soma das tensões na malha fechada seja nula. 


$$V_a+L\frac{di}{dt}+R_i-V_b=0$$


Posteriormente, equaciona-se a somatória dos torques, o que resulta em:

$$J\frac{d\omega}{dt}= T_el-c\omega - \tau$$

Nesse caso, J representa a inércia do rotor, Tel o torque elétrico gerado, c o coeficiente de fricção e  a resistência externa à realização do trabalho desejado. 
As equações apresentadas acima relacionam-se através das constantes de torque (kt) e de velocidade (kv), da seguinte maneira:

$$V_b=k_e$$
$$T_el=k_{t}i$$

onde
	$$k_e= \frac{1}{k_v}$$
Desta maneira, o sistema final é escrito como:

$$L\frac{di}{dt}=-R_i-k_e+V_a$$
$$J\frac{d\omegad}{dt}= k_{t}i-c\omega - tau$$

Definindo a voltagem na armadura $V_a$ e o torque externo $\tau$ como as entradas do sistema, obtemos a representação em espaço de estados a seguir:
![Imagem ilustrativa do Sistema na Representação por Espaço de Estados:](https://i.ibb.co/9s4RQ93/SS.png)


## Simulação
---

O sistema linear apresentado na figura anterior foi implementado no ```Matlab``` . Inseriu-se os valores de entrada $V_a=10V$ para $t=0s$, e = $0,091 Nm$ para $t=10s$. A partir disso, verificou-se a congruência dos resultados obtidos com os informados pelo fabricante, de modo a validar o modelo implementado. Vale destacar, que as unidades, quando necessário, foram devidamente convertidas, a fim de manter a coerência dos resultados.

### Entradas:
---
![Imagem de Gráfico gerada pelo Matlab:](https://i.ibb.co/F8mCP7N/Entradas.png)

### Resposta do Sistema:

![Imagem de Gráfico gerada pelo Matlab:](https://i.ibb.co/PYKVRT3/Resposta.png)

## Estimando Eficiências:
---
Além disso, um segundo ``` script ``` foi implementado em ```Matlab```  para estimar as Eficiências elétrica e mecânica. Para isso, os dados de saída da Simulação acima foram adotados. No caso do indutor, a Potência Média no intervalo de tempo da Simulação também foi adotada.

## Equacionamento:

Potência de Entrada:

$$P_{in} = V_{in}I_{in}$$

Potência do Indutor:

$$P_L = L\frac{di}{dt}$$

Potência do Resistor:

$$P_R = I^2R$$

Eficiência Elétrica:

$$\eta_e = \frac{P_{in} - P_L -P_R}{P_{in}}$$

Potência Mecânica do Motor:

$$P_{mec} = \tau\omega$$

Potência Elétrica:

$$P_{in} - P_L -P_R $$

Eficiência Mecânica:

$$\eta_{mec} = \frac{P_mec}{/P_el} $$
 

 ## Referências Bilbiográficas

 - [Modelagem de Motores DC - Saulo da Paz Almeida](https://doc-00-1g-prod-02-apps-viewer.googleusercontent.com/viewer2/prod-02/pdf/usn95j7fpmmicbpeidtbnds409f01978/vollffg3qc2gsr4javi2umpb9saprvbo/1720517475000/3/108605637848060273413/APznzaZReAMit9l5ZMsInqhtCcwvp5m348bI6VeVC_s1GWayIXZouR3uNhTWV6tcO8NINWuuGpwrnwjaMpaQTtZW9AfPXnB4FeyQlTZL1AqjdAZIUarE0CBHmp8CHVEmSYCX_x-7QZTX4e5APw0HCbgzbPT35QerKwTdWFYyxlXud6fpLScMosfx98izQ97gAy3z5zMSz2vIYlxXmpUh6ZP87fOAyj_6VDss9IablygkxAgm_pNQkvX3p2oyEIAC6MO0-ph6hetW-C8zld_-9tMxlfP7htOKobXQsO_3r84XbkIGyS4lSPO65jOFBlXGcJ2uXCWy12aiBOSwhHMe1OpZZZ13kkfKgozsix0aQwy_h4VeUDx6FM-OuSirnHKXFQWTv1BqV29QCVyuWbVHNTPEB7MoaxiWdCQQkxyUEgZQrF9kbUGwzc8=?authuser=0&nonce=asnmgp77mrqta&user=108605637848060273413&hash=nscmvshi28oabt8f8al7ve4s64b13s35)
 - Bolton, William. Mechatronics: electronic control systems in mechanical and electrical
engineering. Pearson Education, 2003.
 - Maxon UAV propulsion systems(https://www.maxongroup.net.au/medias/sys_master/root/8930376351774/210827-Brosch-UAV-2021-UG-PRINT.pdf . Acesso em 1 de junho de 2024.)
 - OGATA, K. Engenharia de Controle Moderno. 5. ed. São Paulo: Pearson, 2010.

 ## Autores


- Bárbara Silva Francisco
- [@LorenzaBriz0t0](https://github.com/LorenzaBriz0t0) - Lorenza Costa Brizoto
- Lucas Henrique Muniz Branquinho

### SAA0160 - Sistemas de Controle de Aeronaves
## Docentes
- Glauco Augusto de Paula Caurin
- Saulo da Paz Almeida





  



