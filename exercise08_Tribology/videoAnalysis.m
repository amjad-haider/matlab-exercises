function videoAnalysis()

    %Read the file
    v = VideoReader('Video.mov');
    nFrames = v.NumFrames;
    duration = v.Duration;
    
    %Set the start time
    v.CurrentTime = 2.5;
    vidFrame = readFrame(v);

    %get the section of image to focus
    figure(1);
    imagesc(vidFrame);
    [X,Y]=ginput(2);  %Dialog is not displayed in Jupyter
    X = round(X);  %Round to full pixels
    Y = round(Y); 
    % disp(X);
    % disp(Y);
    

    %Loop through the video and save to dataset
    v.CurrentTime = 2.5;
    for i = 1:nFrames
        videoFrame = read(v,i);
        trim = videoFrame(min(Y):max(Y), min(X):max(X),:);
        threshold = 100;
        red = trim(:,:,1) > threshold;
        green = trim(:,:,2) > threshold;
        blue = trim(:,:,3) > threshold;
        area = blue&not(red)&not(green);
        [B,L]= bwboundaries(area,'noholes');
        stats = regionprops('table',L,'Centroid');
        c(i) = stats.Centroid(1);
    end

    stats
    plot([1:nFrames],c,"Color",'r','Marker','o');
    xlabel("Frames");
    ylabel("Track");
    grid on;

end