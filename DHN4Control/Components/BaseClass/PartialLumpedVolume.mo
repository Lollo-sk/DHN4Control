within DHN4Control.Components.BaseClass;

partial model PartialLumpedVolume
  "Partial model of a Lumped volume of water, operated at constant mass with losses to ambient"
  extends DHN4Control.Interfaces.PartialTwoPort;
  import SI = Modelica.Units.SI;
  import DHN4Control.Media.{cp, rho0};
  
  // Parameters
  parameter SI.Length h "High of the lumped water tank";
  parameter SI.Length D "Diameter of the lumped water tank";
  parameter SI.Temperature T_start = 298.15 "Starting temperature";
  parameter SI.Temperature T_ext = 288.15 "Ambient temperature";
  
  final parameter SI.Volume V = Modelica.Constants.pi*h*(D/2)^2 "Volume of water inside the mixing volume";
  final parameter SI.Mass M = V * rho0 "Mass of water inside the mixing volume";
  
  // Variables
  SI.MassFlowRate m_flow "Mass flow rate across the volume";
  SI.Temperature Ttilde(start = T_start) "Temperatue of the water inside the volume";
  SI.Temperature T[2] "Temperatue of the water entering/leaving the volume";
  SI.HeatFlowRate Q_amb "Heat losses to ambient";
  
  // Output
  Modelica.Blocks.Interfaces.RealOutput temperatureMixVolume annotation(
    Placement(visible = true, transformation(origin = {60, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {83, 61}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  
  equation
  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  m_flow = inlet.m_flow;
  
  // Boundary equations
  if not allowFlowReversal or m_flow > 0 then
    T[1] = inStream(inlet.h_out) / cp;
    T[2] = Ttilde;
  else
    T[1] = Ttilde;
    T[2] = inStream(outlet.h_out) / cp;
  end if;
  inlet.h_out = T[1] * cp;
  outlet.h_out = T[2] * cp;
  temperatureMixVolume = Ttilde - 273.15;
  
  // Energy balance
  M * cp * der(Ttilde) = m_flow * cp * (T[1] - T[2]) - Q_amb;
  
   
  annotation(
    Icon(graphics = {Ellipse(extent = {{-100, 100}, {100, -100}})}));
  
end PartialLumpedVolume;
