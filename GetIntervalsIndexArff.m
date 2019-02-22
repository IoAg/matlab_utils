% function GetIntervalsIndexArff:
%
% Uses the data loaded from an ARFF file along with an attribute name and type
% of eye movement and returns the intervals (as indices) for the specific eye
% movement.
%
% input:
%   data            - data loaded from ARFF file with LoadArff
%   arffAttributes  - attributes returned from LoadArff
%   attribute       - attribute to consider for interval counting
%   moveId          - id for eye movement to consider
%
% output:
%   intervals       - nx2 array (start index, end index)

function [intervals] = GetIntervalsIndexArff(data, arffAttributes, attribute, moveId)
    % initialize data
    intervals = zeros(0,2);

    % find position of attribute in data
    dataIndex = GetAttPositionArff(arffAttributes, attribute);

    intervals = GetIntervalsIndex(data(:,dataIndex), moveId);
end    
