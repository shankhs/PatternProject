%PRMAPPING Mapping class constructor
%
%  W = PRMAPPING(MAPPING_FILE,MAPPING_TYPE,DATA,LABELS,SIZE_IN,SIZE_OUT)
%  U = PRMAPPING(MAPPING_FILE,'untrained',PARS)
%  W = PRMAPPING(MAPPING_FILE,'combiner',PARS)
%
% DESCRIPTION
% A mapping/classifier object W is constructed. It points to the command
% MAPPING_FILE that is able to execute the mapping. It may be used to map a
% dataset A on another dataset B by B = PRMAP(A,W) or by training a mapping 
% using an untrained mapping U and a dataset A: W = PRMAP(A,U) or by modifying,
% (or combining) a mapping W with another mapping V: W_NEW = PRMAP(V,W);
% These operations may also be written as B = A*W, W = A*U or W_NEW = V*W.
%
% As a general rule for the case A is a cell array, B = A*W is executed
% for all elements in A, returning a cell array B: B{i} = A{i}*W. An
% exeception is the mapping type 'fixed_cell', see below.
%
% As PRTools contains many predifined mappings there is no need for the 
% starting user to define his own mappings. Advanced users may inspect
% simple examples like SIGM or SUBSC to see how they are constructed.
%
% MAPPING_FILE       name of the routine used for defining, training or 
%                    executing the mapping. Such a routine (e.g.
%                    'mapfile'), typically a classifier or a data mapping,
%                    should generate a mapping W or U, and should also be
%                    able to accept and execute the following types of calls, 
%                    generated by PRTools depending on the value of 
%                    MAPPING_TYPE:
%  - MAPPING_TYPE = 'untrained': An untrained mapping U is trained by 
%                    W = mapfile(A,U) in which U is typically defined by 
%                    U = mapfile([],PARS{:}) or by just U = mapfile. PRTools
%                    generates W = mapfile(A,U) if the user supplies
%                    V = A*U.
%  - MAPPING_TYPE = 'trained': A trained mapping W can be applied to a 
%                    dataset D by D = mapfile(B,W), resulting in a
%                    dataset D. PRTools generates this call if the user
%                    supplies D = B*W. If W is the result of training an 
%                    untrained mapping U by a dataset A it holds that
%                    D = B*(A*U).
%  - MAPPING_TYPE = 'combiner': A combiner mapping W is able to modify or
%                    combine a set of mappings V. PRTools calls V2 = V1*W
%                    as V2 = mapfile(V1,PARS{:}). If W would not have been
%                    a combiner then V2 = V1*W would have been stored as a
%                    sequential mapping. See SEQUENTIAL
%  - MAPPING_TYPE = 'fixed': D = A*W is executed by D = mapfile(A,PARS{:}).
%                    In practice there is not much of a difference between
%                    a trained and a fixed mapping. The first is found from
%                    data, the latter is defined directly by its parameters
%  - MAPPING_TYPE = 'fixed_cell': Like a fixed mapping. D = A*W is executed 
%                    by D = mapfile(A,PARS{:}). However, in this case A can
%                    be a cell array. It thereby overrides the rule that a
%                    cellarray applied to a mapping is executed element by
%                    element.           
% MAPPING_TYPE       String defining the type of mapping:
%                   'untrained', 'trained', "combiner' or 'fixed', see above.
%                    Default is 'untrained'. PRMAPPING(MAPPING_FILE,DATA) is
%                    equivalent to PRMAPPING(MAPPING_FILE,'untrained',DATA)
% DATA               Data, structure or cell array necessary for defining the
%                    mapping, e.g. the weights of a neural network. DATA is
%                    just used in the MAPPING_FILE for executing the mapping.
%                    For fixed and untrained mappings DATA can only be a
%                    cell array.
% LABELS             Array with labels to be used as feature labels for the
%                    dataset resulting by executing the mapping. So at least
%                    as many labels as defined by SIZE_OUT has to be supplied.
% SIZE_IN            Input dimensionality or size vector describing its shape,
%                    e.g. in case the input space is derived from an image.
%                    For a classifier SIZE_IN is the feature size.
% SIZE_OUT           Output dimensionality or size vector describing its
%                    shape, e.g. in case the output space should represent an
%                    image. For a classifier SIZE_OUT is the number of
%                    classes. Default is the number of labels in LABELS.
%                    SIZE_IN and SIZE_OUT are just used for error checking.
%                    If SIZE_IN is not supplied they are both set to 0 and 
%                    checking is skipped.
%
% Other parameter fields may be set to define the mapping further by
%
%	W = PRMAPPING(MAPPING_FILE, MAPPING_TYPE, DATA, LABELS, ...
%     'field1',V1,'field2',V2, ...)
% or by
%
%	W = PRMAPPING(MAPPING_FILE, MAPPING_TYPE, DATA, LABELS, ...
%     SIZE_IN, SIZE_OUT,'field1',V1,'field2',V2, ...)
%
% The following fields are possible (if not set defaults are supplied):
%
% SCALE               Output multiplication factor. If SCALE is a scalar all
%                     multiplied by it. SCALE may also be a vector with size
%                     as defined by SIZE_OUT to set separate scalings for each
%                     output.
% OUT_CONV            0,1,2,3 for defining the desired output conversion:
%                     0 - no(default), 1: SIGM, 2: NORMM or 3: SIGM and NORMM.
%                     These values are set by cnormc in case of 2-class
%                     discriminants (OUTCONV = 1) and by CLASSC
%                     (OUT_CONV = OUT_CONV+2) to convert densities and
%                     sigmoidal outputs to normalised posterior probabilities.
% COST                Classification costs in case the mapping defines a
%                     classifier. See SETCOST.
% NAME                String with mapping name
% USER                User definable variable
%
% All parameters are stored in fields corresponding to the above names.
% Parameter fields of a given mapping may also be changed by:
%
%	W = SET(W,'field1',V1,'field2',V2, ...)
%
% They may also be set by the routines SETMAPPING_FILE, SETMAPPING_TYPE, 
% SETDATA, SETLABELS, SETSIZE_IN, SETSIZE_OUT, SETSIZE, SETSCALE, SETOUT_CONV,
% SETCOST, SETNAME and SETUSER. Fields may be retrieved by
%
%	VARARGOUT = GET(W,'field1','field2', ...)
%
% or by the routines GETMAPPING_FILE, GETMAPPING_TYPE, GETDATA, GETSIZE_IN,
% GETSIZE_OUT, GETSCALE, GETOUTCONV, GETCOST, GETNAME and GETUSER. 
%
% See also DATASETS, MAPPINGS, SEQUENTIAL
