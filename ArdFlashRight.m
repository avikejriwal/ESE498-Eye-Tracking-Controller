function ArdFlashRight(ard, left, right)

volt = 2.5

writePWMVoltage(ard, left, 0);
writePWMVoltage(ard, right, volt);
pause(1);
writePWMVoltage(ard, left, 0);
writePWMVoltage(ard, right, 0);

end