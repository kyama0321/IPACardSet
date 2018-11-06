%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PlaySnd_IPACard
%
% YamaKatsu (@kyama0321)
% Created: 2 Nov. 2018
% Modified: 6 Nov. 2018
%
% Example: 
% > Select type(s) -> 0 (all)
% > Select type(s) -> 1 (vowels)
% > Select type(s) -> 1 2 3 (vowels and consonants)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set your environment
dirRoot = [getenv('HOME') '/Desktop/IPACardSet/Code/'];
dirSnd  = [dirRoot 'Sounds/'];

% Set repeat times
numRep = 3;

% Load a downloard list of the IPA Card Set
nameListSnd = 'ListSnd_IPACard.csv';
formatSpec = '%s';
fileID = fopen([dirRoot nameListSnd]);
strListSnd = textscan(fileID,formatSpec);
fclose(fileID);

%% Menu
% Clear command window
clc

% Set game types
strMsg = [...
        '========================================\n',...
        ' IPA Card Training\n',...
        ' Author: YamaKatsu (@kyama0321)\n',...
        ' Date: 6 Nov. 2018\n',...
        '========================================\n',...
        '   0. All: No.1 ~ No.111 \n',...
        '   1. Vowels: No.71 ~ No.98 \n',...
        '   2. Consonants (pulmonic): No.1 ~ No.59\n',...
        '   3. Consonants (non-pulmonic): No.60 ~ No.70, No.109 ~ No.111\n',...
        '   4. Other symbols: No.99 ~ No.108\n\n'];
fprintf(strMsg);

% Check inputs
numSwType = []; % Initialize
while isempty(numSwType) == 1
    prompt = 'Select training course(s) -> ';
    strSwType = input(prompt,'s');
    numSwType = str2num(strSwType);
end

% Stack card IDs
numIPACard = []; % Initialize
for i = 1:length(numSwType)
    if numSwType(i) == 0 % All: 1~111
        numIPACard = horzcat(numIPACard,[1:111]);
    elseif numSwType(i) == 1 % Vowels: 71~98
        numIPACard = horzcat(numIPACard,[71:98]);
    elseif numSwType(i) == 2     % Consonants (pulmonic): 1~59
        numIPACard = horzcat(numIPACard,[1:59]);
    elseif numSwType(i) == 3     % Consonants (non-pulmonic): 60~70, 109~111
        numIPACard = horzcat(numIPACard,[60:70,109:111]);
    elseif numSwType(i) == 4     % Other symbols: 99~108
        numIPACard = horzcat(numIPACard,[99:108]);
    else                    % All: 1~111;
        error('Set training courses: 0~4');
    end
end

% Non-Randomizing
numPlaySnd = 1:length(numIPACard);

%% Start IPA Card "Karuta"
% Waiting
swRep = '\n\nStart IPA Card Training: RETURN/ENTER';
input(swRep);

for j = numPlaySnd
    
    % ID
    idxIPACard = numIPACard(j);
    
    % Extract a name of PlaySnd
    strIDPlaySnd = strListSnd{1}{idxIPACard};
    %htmlIDPlaySnd = ['<a href = "' strIDPlaySnd '">' strIDPlaySnd '</a>'];
    
    if ~contains(strIDPlaySnd, 'File%3A') == 1  % https://en.wikipedia or https://commons.wikimedia.org/wiki/
        startStr = 'File:';
        strNamePlaySnd = extractAfter(strIDPlaySnd, startStr);
    else                                        % https://commons.wikimedia.org/w/
        startStr = 'File%3A';
        strNamePlaySnd = extractAfter(strIDPlaySnd, startStr);
    end
    
    % Load sound data
    DirPlaySnd = [dirSnd num2str(idxIPACard, '%03d') '_' strNamePlaySnd];
    [playSnd, fs] = audioread(DirPlaySnd);
    
    disp(' ');
    disp('========================================');
    disp(['Playing: ' num2str(idxIPACard, '%03d') '_' strNamePlaySnd]);
    %disp(htmlIDPlaySnd);
    disp('========================================');
    
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

disp('====================================================')
disp('Finish!!!');
disp('====================================================')