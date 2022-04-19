close all;

addpath('E:\ProgramFile\Matlab_R2021b\toolbox\jsonlab')

json_data = loadjson('D:\img\body3DScene_00000404.json');

csv_data = readtable('D:\img\12.csv');
csv_data = table2array(csv_data);

for col = 1:size(csv_data,1)-1
    if csv_data(col,1) == 0
        for row = 1:52
            csv_data(col,row) = csv_data(col+1,row) ;
        end
    else
        csv_data(col,1) = csv_data(col,1) - 1 ;
    end
end

for u = 1:size(csv_data,1)-1
    
    if csv_data(u,2) == 0
        disp(u)
        csv_data(u,:) = [] ;
    end
end

temp_index = linspace(1,2*length(json_data.bodies),2*length(json_data.bodies));

csv_first_number = zeros(length(json_data.bodies));
json_first_number = zeros(length(json_data.bodies));

csv_sencond_number = zeros(length(json_data.bodies));
json_sencond_number = zeros(length(json_data.bodies));

csv_third_number = zeros(length(json_data.bodies));
json_third_number = zeros(length(json_data.bodies));

for qq = 1:length(json_data.bodies)
    csv_first_number(qq) = csv_data(qq,2);
    csv_sencond_number(qq) = csv_data(qq,3);
    csv_third_number(qq) = csv_data(qq,4);
    json_first_number(qq) = json_data.bodies{1, qq}.joints19(1,5) ;
    json_sencond_number(qq) = json_data.bodies{1, qq}.joints19(1,6) ;
    json_third_number(qq) = json_data.bodies{1, qq}.joints19(1,7) ;
end

pare_csv_order = zeros(size(json_first_number,1));


for i = 1:size(json_first_number,1)
    different = 1000 ;
    for j = 1:size(json_first_number,1)
        distance = abs( csv_first_number(i,1) - json_first_number(j,1) )^2 + abs( csv_sencond_number(i,1) - json_sencond_number(j,1) )^2 + abs( csv_third_number(i,1) - json_third_number(j,1) )^2 ;
        if distance  < different
            disp(csv_first_number(i,1))
            disp(json_first_number(j,1))
            disp(j)
            different = csv_first_number(i,1) - json_first_number(j,1);
            pare_csv_order(i) = j ;
        end
    end
end

csv_temp = zeros(size(csv_data,1));

for i = 1:(size(csv_data,2)) % 52

    for j = 1:(size(json_first_number,1)) % 5
        csv_temp(j) = csv_data(j,i);
    end
    
    for j = 1:(size(json_first_number,1)) % 5
        csv_data(j,i) = csv_temp(pare_csv_order(j,1),1);

    end
end


diff = zeros(3,17) ;

for k = 1:length(json_data.bodies)
    per_human_data = json_data.bodies{1, k}.joints19 ;
    
    % 0 2
    diff(k,1) = sqrt( ((csv_data(k,3*1-1))-(per_human_data(1,4*2-3)))^2 + ((csv_data(k,3*1))-(per_human_data(1,4*2-2)))^2 + ((csv_data(k,3*1+1))-(per_human_data(1,4*2-1)))^2 );
    % 1 18
    diff(k,2) = sqrt( ((csv_data(k,3*2-1))-(per_human_data(1,4*18-3)))^2 + ((csv_data(k,3*2))-(per_human_data(1,4*18-2)))^2 + ((csv_data(k,3*2+1))-(per_human_data(1,4*18-1)))^2 );
    % 2 16
    diff(k,3) = sqrt( ((csv_data(k,3*3-1))-(per_human_data(1,4*16-3)))^2 + ((csv_data(k,3*3))-(per_human_data(1,4*16-2)))^2 + ((csv_data(k,3*3+1))-(per_human_data(1,4*16-1)))^2 );
    % 3 19
    diff(k,4) = sqrt( ((csv_data(k,3*4-1))-(per_human_data(1,4*19-3)))^2 + ((csv_data(k,3*4))-(per_human_data(1,4*19-2)))^2 + ((csv_data(k,3*4+1))-(per_human_data(1,4*19-1)))^2 );
    % 4 17
    diff(k,5) = sqrt( ((csv_data(k,3*5-1))-(per_human_data(1,4*17-3)))^2 + ((csv_data(k,3*5))-(per_human_data(1,4*17-2)))^2 + ((csv_data(k,3*5+1))-(per_human_data(1,4*17-1)))^2 );
    % 5 10
    diff(k,6) = sqrt( ((csv_data(k,3*6-1))-(per_human_data(1,4*10-3)))^2 + ((csv_data(k,3*6))-(per_human_data(1,4*10-2)))^2 + ((csv_data(k,3*6+1))-(per_human_data(1,4*10-1)))^2 );
    % 6 4
    diff(k,7) = sqrt( ((csv_data(k,3*7-1))-(per_human_data(1,4*4-3)))^2 + ((csv_data(k,3*7))-(per_human_data(1,4*4-2)))^2 + ((csv_data(k,3*7+1))-(per_human_data(1,4*4-1)))^2 );
    % 7 11
    diff(k,8) = sqrt( ((csv_data(k,3*8-1))-(per_human_data(1,4*11-3)))^2 + ((csv_data(k,3*8))-(per_human_data(1,4*11-2)))^2 + ((csv_data(k,3*8+1))-(per_human_data(1,4*11-1)))^2 );
    % 8 5
    diff(k,9) = sqrt( ((csv_data(k,3*9-1))-(per_human_data(1,4*5-3)))^2 + ((csv_data(k,3*9))-(per_human_data(1,4*5-2)))^2 + ((csv_data(k,3*9+1))-(per_human_data(1,4*5-1)))^2 );
    % 9 12
    diff(k,10) = sqrt( ((csv_data(k,3*10-1))-(per_human_data(1,4*12-3)))^2 + ((csv_data(k,3*10))-(per_human_data(1,4*12-2)))^2 + ((csv_data(k,3*10+1))-(per_human_data(1,4*12-1)))^2 );
    % 10 6
    diff(k,11) = sqrt( ((csv_data(k,3*11-1))-(per_human_data(1,4*6-3)))^2 + ((csv_data(k,3*11))-(per_human_data(1,4*6-2)))^2 + ((csv_data(k,3*11+1))-(per_human_data(1,4*6-1)))^2 );
    % 11 13
    diff(k,12) = sqrt( ((csv_data(k,3*12-1))-(per_human_data(1,4*13-3)))^2 + ((csv_data(k,3*12))-(per_human_data(1,4*13-2)))^2 + ((csv_data(k,3*12+1))-(per_human_data(1,4*13-1)))^2 );
    % 12 7
    diff(k,13) = sqrt( ((csv_data(k,3*13-1))-(per_human_data(1,4*7-3)))^2 + ((csv_data(k,3*13))-(per_human_data(1,4*7-2)))^2 + ((csv_data(k,3*13+1))-(per_human_data(1,4*7-1)))^2 );
    % 13 14
    diff(k,14) = sqrt( ((csv_data(k,3*14-1))-(per_human_data(1,4*14-3)))^2 + ((csv_data(k,3*14))-(per_human_data(1,4*14-2)))^2 + ((csv_data(k,3*14+1))-(per_human_data(1,4*14-1)))^2 );
    % 14 8
    diff(k,15) = sqrt( ((csv_data(k,3*15-1))-(per_human_data(1,4*8-3)))^2 + ((csv_data(k,3*15))-(per_human_data(1,4*8-2)))^2 + ((csv_data(k,3*15+1))-(per_human_data(1,4*8-1)))^2 );
    % 15 15
    diff(k,16) = sqrt( ((csv_data(k,3*16-1))-(per_human_data(1,4*15-3)))^2 + ((csv_data(k,3*16))-(per_human_data(1,4*15-2)))^2 + ((csv_data(k,3*16+1))-(per_human_data(1,4*15-1)))^2 );
    % 16 9
    diff(k,17) = sqrt( ((csv_data(k,3*17-1))-(per_human_data(1,4*9-3)))^2 + ((csv_data(k,3*17))-(per_human_data(1,4*9-2)))^2 + ((csv_data(k,3*17+1))-(per_human_data(1,4*9-1)))^2 );
    
end

figure(1)

p = plot(diff);

for i = 1:17
    p(i).LineWidth = 2 ;
end

p(1).Color = '#FF0900' ;
p(2).Color = '#FF8000' ;
p(3).Color = '#A8B800' ;
p(4).Color = '#9DFF00' ;
p(5).Color = '#00FFBB' ;
p(6).Color = '#0000FF' ;
p(7).Color = '#00EEFF' ;
p(8).Color = '#00A6FF' ;
p(9).Color = '#0059FF' ;
p(10).Color = '#0011FF' ;
p(11).Color = '#7B00FF' ;
p(12).Color = '#AA00FF' ;
p(13).Color = '#F600FF' ;
p(14).Color = '#FF007B' ;
p(15).Color = '#940000' ;
p(16).Color = '#000000' ;
p(17).Color = '#7A0066' ;

legend('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16');

set(gca,'XTick',0:1:length(json_data.bodies));
xlabel('human')
ylabel('distance')

grid on ;







