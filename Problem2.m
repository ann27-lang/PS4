%% Problem2
close all
clear all

%part a
I1 = 0;
I2 = 0;
Ks = 5;

[A,B,C] = ssvaluesd(I1,I2,Ks);

% part b
I1 = logspace(-2,3,15);
I2 = logspace(-2,3,15);
for x = 1:length(I1)
    for y = 1:length(I2)
        [A1(x,y),~,~] = ssvaluesd(I1(x),I2(y),Ks);
    end
end

figure
surf(I1,I2,A1)
set(gca,'XScale','log')
set(gca,'YScale','log')
xlabel("[I_1]")
ylabel("[I_2]")
zlabel("[A]")

figure
contour3(I1,I2,A1)
set(gca,'XScale','log')
set(gca,'YScale','log')
xlabel("[I_1]")
ylabel("[I_2]")
zlabel("[A]")

% part d
Ks = 35;
I1 = logspace(-2,3,15);
I2 = logspace(-2,3,15);
for x = 1:length(I1)
    for y = 1:length(I2)
        [A2(x,y),~,~] = ssvaluesd(I1(x),I2(y),Ks);
    end
end

figure
surf(I1,I2,A2)
set(gca,'XScale','log')
set(gca,'YScale','log')
xlabel("[I_1]")
ylabel("[I_2]")
zlabel("[A]")

figure
contour3(I1,I2,A2)
set(gca,'XScale','log')
set(gca,'YScale','log')
xlabel("[I_1]")
ylabel("[I_2]")
zlabel("[A]")

