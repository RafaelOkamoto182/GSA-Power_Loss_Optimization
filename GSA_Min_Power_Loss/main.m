% GSA code v1.1.
% Generated by Esmat Rashedi, 2010.
% "	E. Rashedi, H. Nezamabadi-pour and S. Saryazdi,
% �GSA: A Gravitational Search Algorithm�, Information sciences, vol. 179,
% no. 13, pp. 2232-2248, 2009."
%
% Main function for using GSA algorithm.
clear all;clc
%  inputs:
% N:  Number of agents.
% max_it: Maximum number of iterations (T).
% ElitistCheck: If ElitistCheck=1, algorithm runs with eq.21 and if =0, runs with eq.9.
% Rpower: power of 'R' in eq.7.
% F_index: The index of the test function. See tables 1,2,3 of the mentioned article.
%          Insert your own objective function with a new F_index in 'test_functions.m'
%          and 'test_functions_range.m'.
%  outputs:
% Fbest: Best result.
% Lbest: Best solution. The location of Fbest in search space.
% BestChart: The best so far Chart over iterations.
% MeanChart: The average fitnesses Chart over iterations.

 N=50;
 max_it=12;
 ElitistCheck=1; Rpower=1;
 min_flag=1; % 1: minimization, 0: maximization
 number_of_runs = 2;

 save_to_csv = 1; %1:save results and solutions to file, 0: do not save.
 file_name = 'GSA_results.csv'
 results_matrix = [];


 F_index=1;

 for i=1:number_of_runs
 tic;

 [Fbest,Lbest,BestChart,MeanChart]=GSA(F_index,N,max_it,ElitistCheck,min_flag,Rpower);
 Fbest
 Lbest
 elapsed_time = toc

 results_matrix_current_row = [i, N, elapsed_time, Fbest, Lbest];
 results_matrix = [results_matrix; results_matrix_current_row];
endfor

Fbest_mean = mean(results_matrix(:,4))

if save_to_csv==1
  if F_index==1
    csv_headers={'#run','N_iterations','elapsed_time','min_power_loss','VG1', 'VG2', 'VG3', 'VG6', 'VG8', 'Tap4-7', 'Tap4-9', 'Tap5-6', 'Qsh9'};
    % Save headers to a CSV file
  fid = fopen(file_name, 'w');
  fprintf(fid, '%s,', csv_headers{1:end-1});
  fprintf(fid, '%s\n', csv_headers{end});
  fclose(fid);

  % Append numerical data to the same CSV file
  dlmwrite(file_name, results_matrix, '-append', 'delimiter', ',', 'precision', 6);

  end

  if F_index==2
    csv_headers={'#run','N_iterations','elapsed_time','min_power_loss','Pg2','Pg3','Pg6','Pg8','VG1', 'VG2', 'VG3', 'VG6', 'VG8', 'Tap4-7', 'Tap4-9', 'Tap5-6', 'Qsh9'};

  end

  end
 semilogy(BestChart,'--k');
 title(['\fontsize{12}\bf F',num2str(F_index)]);
 xlabel('\fontsize{12}\bf Iteration');ylabel('\fontsize{12}\bf Best-so-far');
 legend('\fontsize{10}\bf GSA',1);

