mu_r = 10; %10 users per hour
mu_s = 30; %30 users per hour
lambda_n = (1:20); % 1 to 20 sessions per hour
lambda_h = lambda_n * (mu_r/mu_s); % loss probability is close to zero
S = 5; %# of resources 
PLNtype1 = zeros(1,20); %Loss Probability for new requests of type1
PLNtype2 = zeros(1,20); %Loss Probability for new requests of type2
PLHtype1 = zeros(1,20); %Loss Probability for handoff requests of type1
PLHtype2 = zeros(1,20); %Loss Probability for handoff requests of type1

%iterate from 1 -> 20 i.e calculating loss probability for different lambda
for i = 1:20
    tt1 = type1(lambda_h, lambda_n, mu_r, mu_s,i,S); %state probability of type 1
    tt2 = type2(lambda_h, lambda_n, mu_r, mu_s,i,S); %state probability of type 2
    PLNtype1(i) = tt1(5) + tt1(6); %loss probability for new requests is P(state 4) and state(5)
    PLNtype2(i) = tt2(5) + tt2(6); %loss probability for new requests is P(state 4) and state(5)
    PLHtype1(i) = tt1(6); %loss probability for handoff requests is P(state 5) 
    PLHtype2(i) = tt2(6); %loss probability for handoff requests is P(state 5) 
end

%plot figures

%figure_1 : Loss Probability for new requests for type 1 and type 2
figure('name','Loss probability for new requests');
plot(lambda_n,PLNtype1,'g',lambda_n,PLNtype2,'b');
title('Loss Probability as a function of \lambda_{n}');
xlabel('\lambda_n : Sessions/Hour')
ylabel('P_{Ln}')
legend('Type 1','Type 2')
grid on;

%figure_2 : Loss Probability for handoff requests for type 1 and type 2
figure('name','Loss probability for handoff requests');
plot(lambda_n,PLHtype1,'g',lambda_n,PLHtype2,'b');
title('Loss Probability as a function of \lambda_{n}');
xlabel('\lambda_n : Sessions/Hour')
ylabel('P_{Lh}')
legend('Type 1','Type 2')
grid on;

