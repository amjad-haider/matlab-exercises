%clear variables
clc, clear, close all;

dataset = read_images();  %external function, must be programmed yourself
plot_2(dataset)  %external function, must be programmed yourself

function dataset = read_images()
        
    img1 = imread("Image Task/Soft Robot 1.jpg");
    img2 = imread("Image Task/Soft Robot 2.jpg");
    dataset.image1=img1;
    dataset.image2=img2;
    
    imagesc(img1);
    %[X1,Y1]=ginput(2)  %Dialog is not displayed in Jupyter
    %trim1 = image(min(Y):max(Y),min(X):max(X),:);
    X1 = round([515.56 793.72]);  %Round to full pixels
    Y1 = round([701.04 364.22]); 
    trim1 = img1(min(Y1):max(Y1),min(X1):max(X1),:);
    dataset.image3 = trim1;

    imagesc(img2);
    %[X2,Y2]=ginput(2)  %Dialog is not displayed in Jupyter
    X2 = round([527.35 847.94]);  %Round to full pixels
    Y2 = round([711.00 123.07]); 
    trim2 = img2(min(Y2):max(Y2),min(X2):max(X2),:);
    dataset.image4=trim2;

    threshold = 100;
    red1 = trim1(:,:,1) > threshold;
    green1 = trim1(:,:,2) > threshold;
    blue1 = trim1(:,:,3) > threshold;
    area1 = blue1&(red1);
    dataset.image5=area1;
    imshow(area1);
        
    red2 = trim2(:,:,1) > threshold;
    green2 = trim2(:,:,2) > threshold;
    blue2 = trim2(:,:,3) > threshold;
    area2 = blue2&(red2);
    dataset.image6=area2;
    imshow(area2);
        
    %[B,L] = bwboundaries(area1,'noholes');
    stats1 = regionprops('table',area1,'Centroid','Area');
    data1 = sortrows(stats1,1,"descend");
    l1 = data1.Centroid(1,2);
    l2 = data1.Centroid(2,2);
           
    stats2 = regionprops('table',area2,'Centroid','Area');
    data2 = sortrows(stats2,1,"descend");
    l3 = data2.Centroid(1,2);
    l4 = data2.Centroid(2,2);
            
    length1=50;
    length2=abs(50/(l1-l2)*(l3-l4));
    dataset.centroids1 = [data1.Centroid(1,1),data1.Centroid(1,2),data1.Centroid(2,1),data1.Centroid(2,2)];
    dataset.centroids2 = [data2.Centroid(1,1),data2.Centroid(1,2),data2.Centroid(2,1),data2.Centroid(2,2)];
    dataset.lengths = [length1 length2];
end


function plot_1(dataset)
    figure(1);
    subplot(2,2,1);
    imshow(dataset.image1)
    subplot(2,2,2);
    imshow(dataset.image2)
    subplot(2,2,3);
    imshow(dataset.image3)
    subplot(2,2,4);
    imshow(dataset.image4)
    set(gcf,'Position',[150,250,500,500])
end


function plot_2(dataset)
    figure(2);
    subplot(2,2,1);
    imshow(dataset.image3)
    subplot(2,2,2);
    imshow(dataset.image4)
    subplot(2,2,3);
    imshow(dataset.image5); hold on;
    plot(dataset.centroids1(1),dataset.centroids1(2),"Marker","o","Color",'r','LineWidth',2);
    plot(dataset.centroids1(3),dataset.centroids1(4),"Marker","o","Color",'r','LineWidth',2);
    subplot(2,2,4);
    imshow(dataset.image6); hold on;
    plot(dataset.centroids2(1),dataset.centroids2(2),"Marker","o","Color",'r','LineWidth',2);
    plot(dataset.centroids2(3),dataset.centroids2(4),"Marker","o","Color",'r','LineWidth',2);
    hold off;
    set(gcf,'Position',[750,250,500,500])
end