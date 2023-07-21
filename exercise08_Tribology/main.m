clc, clear, close all;

%%Example

v=VideoReader('Video.mov');

v.CurrentTime = 2.5;




% Read video frames until available
while hasFrame(v)
    vidFrame = readFrame(v);
    imshow(vidFrame);
    pause(1/v.FrameRate);
end
imshow(vidFrame); 


disp('Variables with random numbers:')
p = rand(1,3); disp(['p = ' num2str(p)])
q = rand(1,3); disp(['q = ' num2str(q)])
r = rand(1,3); disp(['r = ' num2str(r)])
save('pqfile.mat','p','q')
disp('Overwrite variables after saving p and q in pqfile:')
p = 1; disp(['p = ' num2str(p)]) %overwrite variables
q = 1; disp(['q = ' num2str(q)])
r = 1; disp(['r = ' num2str(r)])
load('pqfile.mat')
disp('after reloading pqfile:')
disp(['p = ' num2str(p)]) %result after loading pqfile
disp(['q = ' num2str(q)])
disp(['r = ' num2str(r)])

disp('wariables with random numbers:')
p = rand(1,3); disp(['p = ' num2str(p)]); results.p = p;
q = rand(1,3); disp(['q = ' num2str(q)]); results.q = q;
r = rand(1,3); disp(['r = ' num2str(r)])
save('pqfile2.mat','results')
disp('Delete variables after results was saved in pqfile2.')
clear p q r results %delete variables from the workspace
load('pqfile2.mat')
disp('after reloading pqfile2:')
p = results.p; disp(['p = ' num2str(p)])
q = results.q; disp(['q = ' num2str(q)])

%% Task 

clc ,clear , close all;

% The video Video.mov must be read into Matlab using VideoReader. The number of frames can then be determined.
% 
% The further evaluation is largely analogous to the image evaluation in Contact. Here are a few more notes:
% 
% Due to the large number of frames, the evaluation should be performed in a loop
% The image section should be chosen as small as possible, so that only white background with blue dot is visible on all images
% The color value of an ideal white background is [255,255,255], that of an ideal blue dot [0,0,255]. 
% So it makes sense to exclude all red and green areas. A suitable threshold value must be found out by trials

videoAnalysis();