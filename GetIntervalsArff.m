% function GetIntervalsArff:
%
% Uses the data loaded from an ARFF file along with an attribute name and type
% of eye movement and returns the intervals for the specific eye movement.
%
% input:
%   data            - data loaded from ARFF file with LoadArff
%   arffAttributes  - attributes returned from LoadArff
%   attribute       - attribute to consider for interval counting
%   moveId          - id for eye movement to consider
%
% output:
%   intervals       - nx6 array (start time, start x, start y, end time, end x, end y)

function [intervals] = GetIntervalsArff(data, arffAttributes, attribute, moveId)
    
    intervalIndices = GetIntervalsIndexArff(data, arffAttributes, attribute, moveId);

    % initialize data
    intervals = zeros(size(intervalIndices,1),6);

    % find position of attribute in data
    timeIndex = GetAttPositionArff(arffAttributes, 'time');
    xIndex = GetAttPositionArff(arffAttributes, 'x');
    yIndex = GetAttPositionArff(arffAttributes, 'y');

    for i=1:size(intervals,1)
        startIndex = intervalIndices(i,1);
        endIndex = intervalIndices(i,2);
        intervals(i,:) = [data(startIndex,timeIndex) data(startIndex,xIndex) data(startIndex,yIndex) data(endIndex,timeIndex) data(endIndex,xIndex) data(endIndex,yIndex)];
    end
end    
