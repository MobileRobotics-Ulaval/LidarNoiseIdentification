load 'C:\Users\Oli\Desktop\Robotique\matlab_scripts\data\data.mat';

value = 'd';  

figure;
hold on;

scatter(data.utm.indoor.steel.d0_2.result.int(1:10:end), ...
       data.utm.indoor.steel.d0_2.result.err(1:10:end), 4, data.utm.indoor.steel.d0_2.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.steel.d0_2.result.int(1:10:end), data.utm.indoor.steel.d0_2.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.steel.d1_0.result.int(1:10:end), ...
       data.utm.indoor.steel.d1_0.result.err(1:10:end), 4, data.utm.indoor.steel.d1_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.steel.d1_0.result.int(1:10:end), data.utm.indoor.steel.d1_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.steel.d2_0.result.int(1:10:end), ...
       data.utm.indoor.steel.d2_0.result.err(1:10:end), 4, data.utm.indoor.steel.d2_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.steel.d2_0.result.int(1:10:end), data.utm.indoor.steel.d2_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.steel.d4_0.result.int(1:10:end), ...
       data.utm.indoor.steel.d4_0.result.err(1:10:end), 4, data.utm.indoor.steel.d4_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.steel.d4_0.result.int(1:10:end), data.utm.indoor.steel.d4_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.steel.d8_0.result.int(1:10:end), ...
       data.utm.indoor.steel.d8_0.result.err(1:10:end), 4, data.utm.indoor.steel.d8_0.result.(value)(1:10:end)); 
% [x, y, w] = statsPerBin(data.utm.indoor.steel.d8_0.result.int(1:10:end), data.utm.indoor.steel.d8_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  

   
   
scatter(data.utm.indoor.iron.d0_2.result.int(1:10:end), ...
       data.utm.indoor.iron.d0_2.result.err(1:10:end), 4, data.utm.indoor.iron.d0_2.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.iron.d0_2.result.int(1:10:end), data.utm.indoor.iron.d0_2.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.iron.d1_0.result.int(1:10:end), ...
       data.utm.indoor.iron.d1_0.result.err(1:10:end), 4, data.utm.indoor.iron.d1_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.iron.d1_0.result.int(1:10:end), data.utm.indoor.iron.d1_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.iron.d2_0.result.int(1:10:end), ...
       data.utm.indoor.iron.d2_0.result.err(1:10:end), 4, data.utm.indoor.iron.d2_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.iron.d2_0.result.int(1:10:end), data.utm.indoor.iron.d2_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.iron.d4_0.result.int(1:10:end), ...
       data.utm.indoor.iron.d4_0.result.err(1:10:end), 4, data.utm.indoor.iron.d4_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.iron.d4_0.result.int(1:10:end), data.utm.indoor.iron.d4_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.iron.d8_0.result.int(1:10:end), ...
       data.utm.indoor.iron.d8_0.result.err(1:10:end), 4, data.utm.indoor.iron.d8_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.iron.d8_0.result.int(1:10:end), data.utm.indoor.iron.d8_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  


   
scatter(data.utm.indoor.board.d0_2.result.int(1:10:end), ...
       data.utm.indoor.board.d0_2.result.err(1:10:end), 4, data.utm.indoor.board.d0_2.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.board.d0_2.result.int(1:10:end), data.utm.indoor.board.d0_2.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.board.d1_0.result.int(1:10:end), ...
       data.utm.indoor.board.d1_0.result.err(1:10:end), 4, data.utm.indoor.board.d1_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.board.d1_0.result.int(1:10:end), data.utm.indoor.board.d1_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.board.d2_0.result.int(1:10:end), ...
       data.utm.indoor.board.d2_0.result.err(1:10:end), 4, data.utm.indoor.board.d2_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.board.d2_0.result.int(1:10:end), data.utm.indoor.board.d2_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
plot(x(:,1),y(:,3),'--k') 
scatter(data.utm.indoor.board.d4_0.result.int(1:10:end), ...
       data.utm.indoor.board.d4_0.result.err(1:10:end), 4, data.utm.indoor.board.d4_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.board.d4_0.result.int(1:10:end), data.utm.indoor.board.d4_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.board.d8_0.result.int(1:10:end), ...
       data.utm.indoor.board.d8_0.result.err(1:10:end), 4, data.utm.indoor.board.d8_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.board.d8_0.result.int(1:10:end), data.utm.indoor.board.d8_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  



% alu d = 0.2 : erreur d'exp
scatter(data.utm.indoor.alu.d0_2.result.int(1:10:end), ...
       data.utm.indoor.alu.d0_2.result.err(1:10:end), 4, data.utm.indoor.alu.d0_2.result.(value)(1:10:end));


scatter(data.utm.indoor.alu.d1_0.result.int(1:10:end), ...
       data.utm.indoor.alu.d1_0.result.err(1:10:end), 4, data.utm.indoor.alu.d1_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.alu.d1_0.result.int(1:10:end), data.utm.indoor.alu.d1_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.alu.d2_0.result.int(1:10:end), ...
       data.utm.indoor.alu.d2_0.result.err(1:10:end), 4, data.utm.indoor.alu.d2_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.alu.d2_0.result.int(1:10:end), data.utm.indoor.alu.d2_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k') 
scatter(data.utm.indoor.alu.d4_0.result.int(1:10:end), ...
       data.utm.indoor.alu.d4_0.result.err(1:10:end), 4, data.utm.indoor.alu.d4_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.alu.d4_0.result.int(1:10:end), data.utm.indoor.alu.d4_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  
scatter(data.utm.indoor.alu.d8_0.result.int(1:10:end), ...
       data.utm.indoor.alu.d8_0.result.err(1:10:end), 4, data.utm.indoor.alu.d8_0.result.(value)(1:10:end));
% [x, y, w] = statsPerBin(data.utm.indoor.alu.d8_0.result.int(1:10:end), data.utm.indoor.alu.d8_0.result.err(1:10:end), 50);
% plot(x(:,1),y(:,1),'--k')
% plot(x(:,1),y(:,2),'.k')
% plot(x(:,1),y(:,3),'--k')  


title('All plates : Color = incidence')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.15, 0.2]);
xlim([0, 14000]);