% Author: Mario Frakulla
% Date Created: 08/08/2018
% Description: importing/exporting data from csv files in MATLAB
% The exporter takes as input a .mat file of your workspace where you store
% the headers and data of the csv file
% The importer prompts the user to select a csv file to read from
function CSV_functions()
    answer = questdlg('What operation do you want to perform ?' , ...
        'CSV Import/Export', 'Import', 'Export', 'Export');
    
    switch answer
        
        case 'Import'
            filnm = uigetfile('*.csv', 'Select the csv file you want to import');
            [data, header] = ImportCSV(filnm);
            save('CSVData.mat', 'data', 'header');
            
        case 'Export'
            wrksp = uigetfile('*.mat', 'Select the data & header you want to export as csv');
            dt = load(wrksp, '-mat');
            list = {};
            header = {};
            data = []; 
            
            if isstruct(dt)
                list = fieldnames(dt);
                 
                if length(list) > 1

                    for j = 1 : length(list)

                        if ~iscell(dt.(list{j}))
                            data = dt.(list{j});

                        else
                            header = dt.(list{j});
                        end
                    end

                elseif length(list) == 1
                    
                    if iscell(dt.(list{1}))             %header
                        header = dt.(list{1});
                    
                    else 
                        data = dt.(list{1});
                    end
                end
            
           elseif isempty(dt)
                disp('Loaded Workspace is empty')
           end  
    end

    if isempty(data)
        ExportCSV({},header);
        
    elseif isempty(header)
        ExportCSV(data, {});
        
    else
         ExportCSV(data, header);
    end     
    
    function [data, header] = ImportCSV(filename)
        %Returns an array of headers and a matrix/array of data
        data = csvread(filename, 2);
        FID = fopen(filename, 'r');
        header = cell(strsplit(fgetl(FID), ','));
        fclose all;
    end

    function ExportCSV(data_array, headers_array)
        % headers_array --> 1 x M array of headers
        % data_array --> N x M array of data 
        savefilename = inputdlg('Enter a file name: ', 'Filename');
        namecsv = horzcat(savefilename{1}, '.csv');
        FID = fopen(namecsv, 'w'); 
        % Allowing the user to export as csv with/without headers
        % csv without headers case --> input only data_array
        % csv with headers case --> input both data_array and headers_array
        
        if isempty(headers_array)
            dlmwrite(namecsv, data_array, '-append');
            fclose all;
                
        elseif isempty(data_array)
            fprintf(FID, '%s,',  headers_array{1,1:end-1});
            fprintf(FID, '%s\n', headers_array{1,end}); 
            fclose all;
            
        else             
            fprintf(FID, '%s,',  headers_array{1,1:end-1});
            fprintf(FID, '%s\n', headers_array{1,end});
            dlmwrite(namecsv, data_array, '-append');
            fclose all;
        end
    end
end