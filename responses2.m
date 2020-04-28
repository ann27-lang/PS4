function [theta,x,y] = responses2(input,kappa)
for i = 1:length(input)
        theta(i) =  (input(i))/(1+(input(i)));
        ax = (5*theta(i)-1);
        bx = (kappa+5*theta(i)*kappa-5*theta(i)+1);
        cx = -5*theta(i)*kappa;
        xout = zeros(2,1);
        dx = sqrt(bx^2 - 4*ax*cx);
        xout(1) = ( -bx + dx ) / (2*ax);
        xout(2) = ( -bx - dx ) / (2*ax);
        for k = 1:2
            ay = (10*xout(k)-1);
            by = (kappa+10*xout(k)*kappa-10*xout(k)+1);
            cy = -10*xout(k)*kappa;
            yout = zeros(2,1);
            dy = sqrt(by^2 - 4*ay*cy);
            yout(k,1) = ( -by + dy ) / (2*ay);
            yout(k,2) = ( -by - dy ) / (2*ay);
            for j = 1:2
                if (0 <= xout(k) && xout(k) <= 1) && (0 <= yout(k,j) && yout(k,j) <= 1)
                    x(i) = xout(k);
                    y(i) = yout(k,j);
                end
            end

        end
end
                