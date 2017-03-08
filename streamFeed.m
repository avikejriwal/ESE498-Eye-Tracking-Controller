clear;
clc;

pointInit = [0 0];
angInit = 0; %current angle in radians

speed = 2; %speed parameter

angNew = angInit;

loopBool = true;

ard = arduino('com5', 'uno'); %Arduino object
left = 'D3';
right = 'D6';

a = 0:0.1:8*pi;

x = 0.5*sin(a)+0.5;
y = sin(a);

global instructValue;
instructValue=0;

while(loopBool)
    writeDigitalPin(ard, left, 0);
    writeDigitalPin(ard, right, 0);
    
    %x = last 5 seconds of data
    %y = last 5 seconds of data
    
    dataStream = instructValue; %constantly receive new input
    dist = 0;
    switch dataStream %move the cursor based on current command
        case 0 %stop
            dist = 0;
            angNew = angInit; %don't want to waste time moving the figure if it's a stop command anyways
            instructValue = 0;
        case 1 %forward
            dist = speed;
            angNew = angInit;
            [pointInit(1), pointInit(2), angNew] = arrowPlot(pointInit, angInit, angNew, dist);
            instructValue = 0;
            
            ArdForward(ard, left, right);
        case 2 %%left
            angNew = angInit + pi/4;
            dist = 0;
            [pointInit(1), pointInit(2), angNew] = arrowPlot(pointInit, angInit, angNew, dist);
            instructValue = 0;
            
            ArdFlashLeft(ard, left, right);
        case 3 %right
            angNew = angInit - pi/4;
            dist = 0;
            [pointInit(1), pointInit(2), angNew] = arrowPlot(pointInit, angInit, angNew, dist);
            instructValue = 0;
            
            ArdFlashRight(ard, left, right);
        case 4 %kill switch
            loopBool = false;
    end

angInit = angNew; %update the current angle
pause(3)
end

clear ard; %close the connection