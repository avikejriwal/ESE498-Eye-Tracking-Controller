function instruc = positionInstr(x)
global instructValue

global positionX
global positionY
global vecAngle

leftCount = 0;
rightCount = 0;

for n = 1:(length(x)-1)
    if(abs(x(n)) < 0.5)        
        if(x(n+1) >= 0.5)
            leftCount = leftCount + 1;
            rightCount = 0;
        end
        if(x(n+1) <= -0.5)
            rightCount = rightCount + 1;
            leftCount = 0;
        end
    end
end

p1 = [positionX, positionY];


if(leftCount >=3)
    instruc = 2;
    [positionX, positionY, vecAngle] = arrowPlot(p1, vecAngle, vecAngle+pi/4, 0); 
elseif(rightCount >=3)
    instruc = 3;
    [positionX, positionY, vecAngle] = arrowPlot(p1, vecAngle, vecAngle-pi/4, 0);
else
    instruc = 0;
end

%Given a 5-second window of position, if we see the eye flicker between
%left and center 3 times, then issue a left command, and so on
instructValue=instruc;

end