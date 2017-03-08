function toggleMove

global positionX
global positionY
global vecAngle 
global instructValue

dist = 0.3;

instructValue = 1;
[positionX, positionY, vecAngle] = arrowPlot([positionX positionY], vecAngle, vecAngle, dist);
end
