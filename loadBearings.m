function [ bearings ] = loadBearings(  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    import Bearing.*
       
    bearing1 = Bearing(5, 15, degtorad(0), 1);
    bearing1 = setOrbitalFrequency(bearing1);
    bearing1 = setRotationFrequency(bearing1);
    
    
    bearing2 = Bearing(6, 16, degtorad(0), 2);
    bearing2 = setOrbitalFrequency(bearing2);
    bearing2 = setRotationFrequency(bearing2);
    
    
    bearing3 = Bearing(4.5, 23.5, degtorad(0), 3);
    bearing3 = setOrbitalFrequency(bearing3);
    bearing3 = setRotationFrequency(bearing3);
    
    bearings = [bearing1, bearing2, bearing3];
end

