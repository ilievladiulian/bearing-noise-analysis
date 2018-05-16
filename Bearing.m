classdef Bearing
    properties
        id %Rolling bearing id
        fc %Orbital revolution frequency of rolling elements (Hz)
        fb %Rotation frequency of rolling elements (Hz)
        Da %Diameter of rolling elements (mm)
        dm %PCD of rolling elements (mm)
        a  %Contact angle(°)
    end
    
    methods (Access = public)
        
        function obj = Bearing(arg1, arg2, arg3, arg4)
            obj.Da = arg1;
            obj.dm = arg2;
            obj.a = arg3;
            obj.id = arg4;
        end
        
        function obj = setOrbitalFrequency(obj)
            obj.fc = (1/60) * (235/2) * ((obj.dm - obj.Da * cos(obj.a))/obj.dm);
        end
        
        function obj = setRotationFrequency(obj)
            obj.fb = (1/60) * (235/2) * (obj.dm/obj.Da - (obj.Da * cos(obj.a)^2)/obj.dm);
        end
        
        function frequency = getOrbitalFrequency(obj)
            frequency = obj.fc;
        end
        
        function frequency = getRotationFrequency(obj)
            frequency = obj.fb;
        end
        
        function Da = getDiameter(obj)
            Da = obj.Da;
        end
        
        function dm = getPCD(obj)
            dm = obj.dm;
        end
        
        function a = getAngle(obj)
            a= radtodeg(obj.a);
        end
    end
    
end