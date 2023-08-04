function output=w3_param_to_t(sig3)

% function output=w3_param_to_t(sig3)

% This function determines an approximate vector of time t for DOVE
% FWM.  Due to the off-resonant nature of the final w3 pulse, the number
% of times t has to be evaluated is small.

% About 10 data points are needed in along w3 for the most part.

tvec=(-2*sig3:4*sig3/10:2*sig3);


output=tvec;
