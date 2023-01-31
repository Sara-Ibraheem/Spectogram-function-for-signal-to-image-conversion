clear all
close all
clc

tic

numfiles= 501;
Nfeatures=[];
fs=1000;

iHopLength      = 50; %% Used in Spectrogram calculation for Spectral Fearures
iBlockLength    = 100; %% Used in Spectrogram calculation for Spectral Fearures

    


for p=1:numfiles
    myfilename = sprintf('L (%d).mat',p);
    PQD= importdata(myfilename);
    
    for i=1:1
  x=PQD(:,i);
    
    v=x';
        afWindow    = hann(iBlockLength,'periodic');
        spectrogram( v,...
                                    afWindow,...
                                    iBlockLength-iHopLength,...
                                    iBlockLength,...
                                    fs,'reassigned');
    
    set(gca, 'Visible', 'off');
    colorbar('off');
    filename=sprintf('I(%d).png',p);
    saveas(gcf,filename);



disp('*****')
disp(i)
disp('*****')
    end
end


toc