% return states numb of a DES name
function state_num = statenum(name1)

[state_num, tran_size, is_det, is_controllable, tranlist, marklist] = getdes_parameter(name1);

%state_num = state_size;

end %function
% the end -----------------------------------------------------------------