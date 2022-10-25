within DHN4Control.Sources;

model FixedMassFlowPump
  "Ideal Mass flow pump with fixed parameter, flow from inlet to outlet"
  extends DHN4Control.Sources.BaseClass.PartialIdealPump;
  
  parameter Modelica.Units.SI.MassFlowRate M = 1 "Imposed mass flow"; 
equation
  inlet.m_flow = M;
end FixedMassFlowPump;
