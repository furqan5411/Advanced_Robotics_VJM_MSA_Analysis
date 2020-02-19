


x = -100:10:100;
y = -100:10:100;
z= -100:10:100;
F = [100 0 0 0 0 0];

z1 = zeros(length(x),length(y),length(z));

for i = 1:length(x)
%     disp(i/length(x)*100)
    for j = 1:length(y)
        for k = 1:length(z)
        % Calc robot stiffnes matrix
        [K] =VJM_lin_total(x(i)/1000, y(j)/1000,z(k)/1000);
        % Get deflections for all configurations
        dt=F*K;
        dr=sqrt(dt(1)^2+dt(2)^2+dt(3)^2);
        z1(i,j,k) = dr;
        end
    end    
end





figure()
for kk=1: length(z1)
%     img = peaks(128);
%     contour(img,128)
    [M,c]=contour3(z1(:,:,kk));
    c.LineWidth=7;
%     daspect([1 1 1])
    
    colormap(map)%     caxis([-10 10 10])
    colorbar
    hold on
end
