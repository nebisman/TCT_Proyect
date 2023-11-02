% Clear and close everything
clear all; close all; fclose all;

% Run setup.m
setup;

% Set working folder
init('..');

% Supervisor design procedure
% Step 1

% Creat plant (components)
Q = 4; % number of states
       % the initial state q0 is always labeled "0"
Qm = [0,3]; % marker state set
delta = [0,11,1; % transition triples (exit state, event, enter state)
          1,10,0;
          1,12,2;
          2,13,0;
          0,15,3];
create('PLANT', Q, delta, Qm); % create automaton
%figure(1)
%displaydes('PLANT') % display automaton

% Creat specification (components)
Q = 2; % number of states
       % the initial state q0 is always labeled "0"
Qm = [0,1]; % marker state set
delta = [0,11,0; % transition triples (exit state, event, enter state)
         0,12,1;
         1,15,1];
create('E', Q, delta, Qm); % create automaton
%figure(2)
%displaydes('E') % display automaton

%Step 2

allevents('ALL', 'PLANT');
%figure(3)
%displaydes('ALL') % display automaton

%Step 3

sync('SPEC', 'E', 'ALL');
%figure(4)
%displaydes('SPEC') % display automaton

%Step 4

supcon('SUP', 'PLANT', 'SPEC');
%figure(5)

%Step 5

condat('SUPDAT', 'PLANT', 'SUP');

%Supervisor reduction

supreduce('SIMSUP', 'PLANT', 'SUP', 'SUPDAT');
%figure(6)
displaydes('SIMSUP') % display automaton
%test correctness of SIMSUP 
sync('TEST','SIMSUP','PLANT');
isomorph('TEST','SUP')
displaydes('ALL')

displaydes('PLANT') % display automaton
printdes('PLANTaaaaaa')