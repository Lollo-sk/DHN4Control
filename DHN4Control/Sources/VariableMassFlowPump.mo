within DHN4Control.Sources;

model VariableMassFlowPump
  "Controllable mass flow pump, flow from inlet to outlet"
  extends DHN4Control.Sources.BaseClass.PartialIdealPump;
  Modelica.Blocks.Interfaces.RealInput M annotation(
    Placement(visible = true, transformation(origin = {-78, 58}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-78, 60}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  inlet.m_flow = M;
end VariableMassFlowPump;
