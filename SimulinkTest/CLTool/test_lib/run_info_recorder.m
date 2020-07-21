function [ ] = run_info_recorder( info )
%     coder.extrinsic('evalin','assignin','sprintf','extract_specified_element','disp');
%     coder('-sync:on','evalin','assignin');
    assignin('base','run_info',sprintf('%sLast_False#%f$',evalin('base','run_info'),info));
end

