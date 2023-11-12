load('2022_FQ_CRN_38655_FPP_DATA.mat')
figure(1);
y1 = x(:,1);
y2 = x(:,2);
plot(y1, 'DisplayName', 'left channel')
hold on; grid;
plot(y2, 'DisplayName', 'right channel')%Created a plot for x
hold off;
legend

player = audioplayer(x, Fs); 
play(player, Fs)

a = dct(x); 

x0=idct(a);

s = norm(x(:,1)-x0(:,1));
t = norm(x(:,1));
u = norm(x(:,2)-x0(:,2));
v = norm(x(:,2));


rel_error = 0.5 * ((s/t)+ (u/v));
%rel_err(x, x0) = 6.9142e-16;

a5 = my_filter(a, 0.5);
a1 = my_filter(a, 0.1);
a01 = my_filter(a, 0.01);
a001 = my_filter(a, 0.001);

x5=idct(a5);
x1=idct(a1);
x01=idct(a01);
x001=idct(a001);

[rel_err_x5, rel_err_a5, comp_ratio_a5] = my_metrics (x, a, x5, a5);
[rel_err_x1, rel_err_a1, comp_ratio_a1] = my_metrics (x, a, x1, a1);
[rel_err_x01, rel_err_a01, comp_ratio_a01] = my_metrics (x, a, x01, a01);
[rel_err_x001, rel_err_a_001, comp_ratio_a001] = my_metrics (x, a, x001, a001);

player = audioplayer(x5, Fs);
play(player, Fs)
player = audioplayer(x1, Fs);
play(player, Fs)
player = audioplayer(x01, Fs);
play(player, Fs)
player = audioplayer(x001, Fs);
play(player, Fs)

Space_Savings_a5 = 1 - comp_ratio_a5; %Space saving value stored in variables.
Space_Savings_a1 = 1 - comp_ratio_a1;
Space_Savings_a01 = 1 - comp_ratio_a01;
Space_Savings_a001 = 1 - comp_ratio_a001;