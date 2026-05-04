%% Clearing workspace

clear all
close all
clc

%% Plotting data for contant x_0

[ x_hat1, x_01, err1, err_sos1, ex_1 ] = RunTestData('Data_const', @BatchMethod );
[ x_hat2, x_02, err2, err_sos2, ex_2 ] = RunTestData('Data_const', @RLSMethod );

figure
hold on
plot((50:500), err_sos1, 'b');
plot((50:500), err_sos2, 'r--');
legend('Batch', 'RLS');
xlabel('Iteration');
ylabel('Square of Sum error');
title('Error with constant x_0');

figure
hold on
plot((50:500), ex_1, 'b');
plot((50:500), ex_2, 'r--');
legend('Batch', 'RLS');
xlabel('Iteration');
ylabel('Square of Sum error');
title('ex with constant x_0');

%% Plotting data for changing x_0

[ x_hat1, x_01, err1, err_sos1, ex_1 ] = RunTestData('Data_offset', @BatchMethod );
[ x_hat2, x_02, err2, err_sos2, ex_2 ] = RunTestData('Data_offset', @RLSMethod );

figure
hold on
plot((50:500), err_sos1, 'b');
plot((50:500), err_sos2, 'r--');
legend('Batch', 'RLS');
xlabel('Iteration');
ylabel('Square of Sum error');
title('Error with linearly changing x_0');

figure
hold on
plot((50:500), ex_1, 'b');
plot((50:500), ex_2, 'r--');
legend('Batch', 'RLS');
xlabel('Iteration');
ylabel('Square of Sum error');
title('ex with constant x_0');