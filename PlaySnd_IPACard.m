%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PlaySnd_IPACard
%
% Yamamoto, K. 
% Created: 2 Nov. 2018
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% Set your enviroment
dirRoot = [getenv('HOME') '/Desktop/TmpFiles/IPACardSet/'];
dirSnd  = [dirRoot 'Sounds/'];
%%%%%%%%%%%%%%%%%%%%%

% Set game levels (under construction)
swLevel = 0;
if swLevel == 1 % Vowels
    numIPACard = 71:98;
elseif swLevel == 2     % Consonants (pulmonic)
    numIPACard = 1:59;
elseif swLevel == 3     % Consonants (non-pulmonic)
    numIPACard = [60:70,109:111];
elseif swLevel == 4     % Other symbols
    numIPACard = 99:108;
else                    % All
    numIPACard = 1:111;
end
    
% Set repeat times
numRep = 3;

% Load a list of the IPACard
nameListSnd = 'IPACard_ListSnd.csv';
formatSpec = '%s';
fileID = fopen(nameListSnd);
strListSnd = textscan(fileID,formatSpec);
fclose(fileID);

% Randomizing with a seed number
seed = 20181102;
rng(seed);
numPlaySnd = randperm(max(numIPACard));


%% Start IPA Card "Karuta"
% Waiting
swRep = 'Start IPA Card "Karuta": RETURN/ENTER';
input(swRep);

for i = numPlaySnd
    
    % Extract a name of PlaySnd
    strIDPlaySnd = strListSnd{1}{i};
    
    if ~contains(strIDPlaySnd, 'File%3A') == 1  % https://en.wikipedia or https://commons.wikimedia.org/wiki/
        startStr = 'File:';
        strNamePlaySnd = extractAfter(strIDPlaySnd, startStr);
    else                                        % https://commons.wikimedia.org/w/
        startStr = 'File%3A';
        strNamePlaySnd = extractAfter(strIDPlaySnd, startStr);
    end
    
    % Load sound data
    DirPlaySnd = [dirSnd num2str(i, '%03d') '_' strNamePlaySnd];
    [playSnd, fs] = audioread(DirPlaySnd);
    
    disp('====================================================')
    disp(['Playing: ' num2str(i, '%03d') '_' strNamePlaySnd]);
    disp('====================================================')
    
    % Calibrate the signal level to -26 in the digital level (RMS)
    rmsdBSnd = 20*log10(sqrt(mean(playSnd.^2)));
    gaindB = -26 - rmsdBSnd(1);
    playSndCalib = 10^(gaindB/20)*playSnd;
    
    % Play playSndCalib
    swRep = 'y';
    while swRep == 'y'
        for j = 1:numRep
            
            pause(1.0)
            sound(playSndCalib, fs);
            pause(2.0)
            
        end
        
        % Waiting
        prompt = 'One more time? (y/n) -> ';
        swRep = input(prompt, 's');
    end
    
end