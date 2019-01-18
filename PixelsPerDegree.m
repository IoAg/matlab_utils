% function PixelsPerDegree:
%
% This function returns the approximation of pixels per degree for each
% dimension.  It doesn't take into account the change in distance as we move to
% the edges of the monitor.
%
% input:
%   width        - width of monitor in meters
%   height       - height of monitor in meters
%   distance     - distance of the viewer in meters
%   widthPixels  - width of moitor in pixels
%   heightPixels - height of monitor in pixels
% output:
%   pxPerDeg     - pixels per degree on X axis(approx.)
%   pyPerDeg     - pixels per degree on Y axis(approx.)

function [pxPerDeg, pyPerDeg] = PixelsPerDegree(width, height, distance, widthPixels, heightPixels)
    thetaWtotal = 2*atan(width/(2*distance))*180/pi;
    thetaHtotal = 2*atan(height/(2*distance))*180/pi;

    pxPerDeg = widthPixels/thetaWtotal;
    pyPerDeg = heightPixels/thetaHtotal;
end
