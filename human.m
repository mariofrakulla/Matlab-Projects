% Author: Mario Frakulla
% Date: 07/01/2018
% Matlab OOP practice
% human subclass inheriting from animals

classdef human < Animals
    
    properties
        Friends;
    end
   
    methods
        
        function obj = human(height, weight, foodType, friends)
            obj = obj@Animals(height, weight, foodType); 
            obj.Friends = friends; 
        end
    end
end