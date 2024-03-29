within DHN4Control.Sensors.BaseClass;
  
partial model PartialAbsoluteSensor
  extends DHN4Control.Interfaces.PartialOnePort;
equation
  // No flow in or out of the sensor
  inlet.m_flow = 0;
  inlet.h_out = 0;
end PartialAbsoluteSensor;
