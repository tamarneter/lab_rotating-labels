function [LE,TE,LEindex,TEindex] = RotationForLabeling(data0,Labels);
%% for blahblah label
%for other labels the if condition will change and there may be more loops
%for other parts of the wing...:)
% data0 = [0.415854000000000,0.390270000000000;0.395198000000000,0.181281000000000;0.434462000000000,0.649424000000000;0.443737000000000,0.783400000000000;0.452009000000000,0.907315000000000;0.460510000000000,1.04185800000000;0.470296000000000,1.16802400000000;0.479780000000000,1.30277800000000;0.488982000000000,1.42845700000000;0.504011000000000,1.51589600000000;0.439209000000000,0.184928000000000;0.447884000000000,0.388625000000000;0.466250000000000,0.647400000000000;0.475430000000000,0.774447000000000;0.486064000000000,0.907588000000000;0.494571000000000,1.03073400000000;0.505923000000000,1.16668800000000;0.517556000000000,1.29600800000000;0.531579000000000,1.42738000000000;0.539287000000000,1.51220400000000];

% figure(1);
% plot(data(:,1),data(:,2));
% xlabel('x');
% ylabel('y');

% R = rotz(0);
% ROT_IWANT = R(1:2,1:2);
% ROT_XY = data*ROT_IWANT;
% switch Case 
%     case 'Ashur'
%         R_Ashur = rotz(-3);
%         ROT_IWANT_Ashur = R_Ashur(1:2,1:2);
%         data_rot = data*ROT_IWANT_Ashur;
%         x = data_rot(:,1).';
%         y = data_rot(:,2).';
%         x_sorted = sort(x);
%         l = length(x);
%         
        
%     case 'blahblah'
        R_blahblah = rotz(-3);
        ROT_IWANT_blahblah = R_blahblah(1:2,1:2);
        data0_rot = data0*ROT_IWANT_blahblah;
        x = data0_rot(:,1).';
        y = data0_rot(:,2).';
        x_sorted = sort(x);
        l = length(x);

        for i=[1:1:l/2]
            xi(i) = data0_rot(i,1);
            yi(i) = data0_rot(i,2);
            if xi(i) < x_sorted(l/2)
                [LE,LEindex] = sortrows(data0_rot(1:10,:),2);
                disp(LE);
                disp(LEindex);
            end
        end

        for i=[l/2:1:l]
            xi(i) = data0_rot(i,1);
            yi(i) = data0_rot(i,2);
            if xi(i) > x_sorted(l/2)
                [TE,TEindex] = sortrows(data0_rot(11:20,:),2);
                disp(TE);
                disp(TEindex+(l/2));
            end
        end
        wing = [LE.',TE.'];
        % figure(2)
        % hold on;
        % plot(ROT_XY(:,1),ROT_XY(:,2),'-*');
        % plot(data_rot(:,1),data_rot(:,2),'-*');
        % legend('original','rotated');
        % xlabel('x');
        % ylabel('y');
   


end