%DEFINE_MAPPING Define untrained or fixed mapping
%
%   W = DEFINE_MAPPING(ARGIN,TYPE,NAME)
%
% INPUT
%   ARGIN   - Cell array with arguments of calling routine
%   TYPE    - Mapping type, 'fixed', 'untrained (default)' or 'combiner'
%   NAME    - Name of the mapping, default name of calling routine
%
% OUTPUT
%   W       - Mapping
%
% DESCRIPTION
% This routine fascilitates the definition of untrained, fixed and
% combiners in order to make the definition of mappings more readable.
%
% SEE ALSO
% MAPPINGS, PRMAPPING, TRAINED_CLASSIFIER, TRAINED_MAPPING, MAPPING_TASK

% Copyright: Robert P.W. Duin, prtools@rduin.nl

function w = define_mapping(varargin)

[pars,type,mapname] = setdefaults(varargin,[],'untrained',[]);
fname = callername;
if isempty(mapname)
  mapname = fname;
end
if numel(pars) < 2
  w = prmapping(fname,type);
else
  w = prmapping(fname,type,pars(2:end));
end
w = setname(w,mapname);
return

%CALLERNAME
%
%	NAME = CALLERNAME
%
% Returns the name the calling function 

function name = callername

[ss ,i] = dbstack;
if length(ss) < 3
	name = [];
else
	name = ss(3).name;
end
    