% return states numb of a DES name
function trans_num = transnum(name1)

[state_size, trans_num, is_det, is_controllable, tranlist, marklist] = getdes_parameter(name1);

%trans_num = tran_size;

end %function
% the end -----------------------------------------------------------------