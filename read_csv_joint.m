close all;

addpath('E:\ProgramFile\Matlab_R2021b\toolbox\jsonlab')

csv_store = dir ('D:\output_txt') ;

name = 'name' ;

all_x = zeros(1,10);
all_y = zeros(1,10);
all_z = zeros(1,10);
all_confidence = zeros(1,1000);

draw_x = zeros(1,17) ;
draw_y = zeros(1,17) ;
draw_z = zeros(1,17) ;

counter = 0 ;


for i = 3:3 % length(json_store) 6584

    disp(i)

    csv_file_name = csv_store(i).(name) ;
    disp("read");
    csv_data = readtable('D:\output_txt\' + string(csv_file_name));
    csv_data = table2array(csv_data);

    for col = 1:6
        if csv_data(col,1) == 0
            for row = 1:52
                csv_data(col,row) = csv_data(col+1,row) ;
                csv_data(col+1,row) = 0 ;
            end
        end

        csv_data(col,1) = csv_data(col,1) - 1 ;
    end


    for k = 1:7
        for j = 1:17
            counter = counter + 1 ;
            figure(i)

            

            all_x(1,counter) = csv_data(k,3*j-1);
            all_y(1,counter) = csv_data(k,3*j);
            all_z(1,counter) = csv_data(k,3*j+1);
 
            draw_x(1,j) = csv_data(k,3*j-1) ; % x  1  5 ....74
            draw_y(1,j) = csv_data(k,3*j) ; % y  2  6 ....75
            %disp(per_human_data(k,4*j-1))
            draw_z(1,j) = csv_data(k,3*j+1) ; % z  3  7 ....76
            %disp(per_human_data(k,4*j))
        end

        hold on;
        grid on ;

        if k == 1
            scatter3(draw_x,draw_y,draw_z,400,"red",'.') ;
            color = "red" ;
        elseif k == 2
            scatter3(draw_x,draw_y,draw_z,400,"green",'.') ;
            color = "green" ;
        elseif k == 3
            scatter3(draw_x,draw_y,draw_z,400,"blue",'.') ;
            color = "blue" ;
        elseif k == 4
            scatter3(draw_x,draw_y,draw_z,400,"magenta",'.') ;
            color = "magenta" ;
        elseif k == 5
            scatter3(draw_x,draw_y,draw_z,400,"cyan",'.') ;
            color = "cyan" ;
        elseif k == 6
            scatter3(draw_x,draw_y,draw_z,400,"yellow",'.') ;
            color = "yellow" ;
        elseif k == 7
            scatter3(draw_x,draw_y,draw_z,400,"black",'.') ;
            color = "black" ;
        elseif k == 8
            scatter3(draw_x,draw_y,draw_z,400,"red",'*') ;
            color = "red" ;
        end

        % ------------ draw joint ------------------

        id_1 = 5;
        id_2 = 3;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 1;
        id_2 = 3;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 2;
        id_2 = 1;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 2;
        id_2 = 4;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 1;
        id_2 = 7;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 1;
        id_2 = 6;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 7;
        id_2 = 6;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 7;
        id_2 = 9;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 9;
        id_2 = 11;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 6;
        id_2 = 8;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 8;
        id_2 = 10;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 7;
        id_2 = 13;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 6;
        id_2 = 12;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 13;
        id_2 = 12;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 13;
        id_2 = 15;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 15;
        id_2 = 17;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 12;
        id_2 = 14;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        id_1 = 14;
        id_2 = 16;
        plot3([draw_x(1,id_1),draw_x(1,id_2)],[draw_y(1,id_1),draw_y(1,id_2)],[draw_z(1,id_1),draw_z(1,id_2)],color,LineWidth=2);

        % --------------- plot joint ------------------
        
    end

    hold off;

    xlabel('x')
    ylabel('-y')
    zlabel('z')

%     saveas(figure(i) , string(i) + '.fig') ;
% 
%     disp("save" + string(i) + '.fig')
% 
%     close all;

end

% figure(1)
% grid on ;
% scatter3(all_x,all_y,all_z,30,"magenta") ;
% 
% xlabel('x')
% ylabel('y')
% zlabel('z')
% 
% figure(2)
% grid on ;
% 
% x_label = linspace(0,length(all_confidence),length(all_confidence)) ;
% 
% plot(x_label,all_confidence)








