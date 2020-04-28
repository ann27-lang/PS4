function [A,B,C] = ssvaluesd(I1,I2,Ks)
    KI = 1;
    syms A B C
    fun1 = (5*A/((1+I1/KI)*(Ks+A)))==(B/(Ks+B));
    fun2 = (5*A/((1+I2/KI)*(Ks+A)))==(C/(Ks+C));
    fun3 = A + B + C == 100;
    fun4 = 0 <= A <= 100;
    fun5 = 0 <= B <= 100;
    fun6 = 0 <= C <= 100;
    sol = solve([fun1 fun2 fun3 fun4 fun5 fun6],[A B C]);
    A = real(double(sol.A));
    B = real(double(sol.B));
    C = real(double(sol.C));
%         for k = 1:size(Abef,1)
%             if      (Abef(k,1) >= 0 && Abef(k,1) <= 100) && ...
%                     (Bbef(k,1) >= 0 && Bbef(k,1) <= 100) && ...
%                     (Cbef(k,1) >= 0 && Abef(k,1) <= 100)
%                 A = Abef(k,1);
%                 B = Bbef(k,1);
%                 C = Cbef(k,1);
%             else
%                 A = 0;
%                 B = 0;
%                 C = 0;
%             end
%         end


end