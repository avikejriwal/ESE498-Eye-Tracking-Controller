function ArdForward(ard, left, right)

volt = 2.5; %voltage between 1 and 5

writePWMVoltage(ard, left, volt);
writePWMVoltage(ard, right, volt+0.01);
pause(1);
writePWMVoltage(ard, left, 0);
writePWMVoltage(ard, right, 0);

end