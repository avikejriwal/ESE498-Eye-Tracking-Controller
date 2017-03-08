global positionX
global positionY
global vecAngle

global instructValue

positionX = 0;
positionY = 0;
vecAngle = 0;

instructValue = 0;

%new line of code
axis([-10 10 -10 10])
grid on
n = 10;
blox = ginput(n);
for k = 1:length(blox)
    rectangle('Position', [blox(k,1) blox(k,2) 1 1], 'FaceColor', 'r') %plot rectangles to generate obstacles
end
hold on %maintain obstacles