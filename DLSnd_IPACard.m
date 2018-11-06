%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% DLSnd_IPACard
%
% YamaKatsu (@kyama0321)
% Created: 2 Nov. 2018
% Modified: 6 Nov. 2018
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Set your environment
dirRoot = [getenv('HOME') '/Desktop/IPACardSet/Code/'];
dirSnd  = [dirRoot 'Sounds/'];

% Make 'Sounds' folder
if exist(dirSnd) ~= 7
    mkdir(dirSnd);
end

% Load a download list of the IPA Card Set
nameListSnd = 'ListSnd_IPACard.csv';
formatSpec = '%s';
fileID = fopen([dirRoot nameListSnd]);
strListSnd = textscan(fileID,formatSpec);
fclose(fileID);


%% Start downloading files
% Waiting
swRep = '\nStart downloading files? : RETURN/ENTER';
input(swRep);

% Start
[numIPACard,~] = size(strListSnd{1});
for i = 1:numIPACard
    
    % ID
    numSnd = i;
    
    % Load an web-link for an IPA card
    urlWebPage = strListSnd{1}{i};
    options = weboptions('ContentType','text');
    [textWebPage] = webread(urlWebPage,options);
    startStr = '<div class="fullMedia"><p>';
    beforeStr = ' &#8206;<span class="fileInfo">';
    htmlLinkSnd = extractBefore(extractAfter(textWebPage, startStr), beforeStr);
    
    % Extract a direct link for the sound
    startStr = '<a href="';
    beforeStr = '" class=';
    strUrlSnd = extractBefore(extractAfter(htmlLinkSnd, startStr), beforeStr);
    if ~contains(strUrlSnd, 'https:') == 1
        strUrlSnd = strcat('https:', strUrlSnd);
    end
    
    % Extract the name of sound file
    tmp = strsplit(strUrlSnd,'/');
    strNameSnd = char(tmp(end));
    dirNameSnd = [dirSnd num2str(numSnd,'%03d') '_' strNameSnd];
    
    % Download the sound file (ogg or oga)
    disp(['---Downloarding: IPA Card No.' num2str(numSnd, '%03d') '---']);
    [Snd] = websave(dirNameSnd,strUrlSnd);
    
end

disp('========================================')
disp('Finish!!!');
disp('========================================')