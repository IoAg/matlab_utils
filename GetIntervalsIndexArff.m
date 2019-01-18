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

    startIndex = -1;
    for i=1:size(data,1)
        if (data(i,dataIndex)==moveId)
            % first element of interval
            if (startIndex==-1)
                startIndex=i;
            end
        else
            % interval finished on previous iteration
            if (startIndex~=-1)
                intervals = [intervals; startIndex i-1];
            end
            startIndex = -1;
        end
    end
    % add last interval
    if (startIndex~=-1)
        intervals = [intervals; startIndex size(data,1)];
    end
end    
