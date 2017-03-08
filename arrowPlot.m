function [pNewX, pNewY, angNew] = arrowPlot(p1, angInit, angArrow, dist)

%test data
p1 = [0 0]; %initial point
angInit = 0;
angArrow = pi; %angle of arrow
dist = 1;

magArrow = 2; %magnitude of arrow (constant)
numIt = 20; %number of gradual iterations
pointNew = p1; %initalize the new point vector

angIterate = linspace(angInit, angArrow, numIt); %iterate the change in angle
distIterate = linspace(0, dist, numIt); %iterate the change in position

h1 = plot(0,0);

for n = 1:numIt %loop small increments so the change appears gradual
    pointNew = [(p1(1)+distIterate(n)*cos(angIterate(n))) (p1(2)+distIterate(n)*sin(angIterate(n)))];  %increment the new center point
    dp = [(magArrow*cos(angIterate(n))), (magArrow*sin(angIterate(n)))]; %create the vector
    
    delete(h1);
    h1 = quiver(pointNew(1), pointNew(2), dp(1), dp(2), 0); %%plot the arrow
    pause(0.02) %pause so changes are visible in real time
end

pNewX = pointNew(1); %return values
pNewY = pointNew(2);
angNew = angArrow;

end