% Author: Mario Frakulla
% Date: 07/01/2018
% Matlab OOP practice
% SuperClass to human class. Illustrates the MATLAB syntax for declaring
% methods, properties, constructor of a class. Also, gives a simple example
% of inheritance in MATLAB  ---> human < Animals

classdef Animals
    properties
       av_height;
       av_weight;
       food; 
    end
    
    methods
        
        function obj = Animals(height, weight, foodType)
            obj.av_height = height;
            obj.av_weight = weight;
            obj.food = foodType;
        end
        
        function obj = set.av_height(obj, height)
            
            if isnumeric(height)
                obj.av_height = height;
                
            else 
               error('Invalid height');
            end
        end
        
        function obj = set.av_weight(obj, weight)
            
            if isnumeric(weight)
                obj.av_weight = weight;
            else
                error('Invalid weight');
            end
        end

        function obj = set.food(obj, foodTyp)
            
            if ischar(foodTyp)
                obj.food = foodTyp;
            
            else 
                error('Invalid Food');
            end
        end
    end
end