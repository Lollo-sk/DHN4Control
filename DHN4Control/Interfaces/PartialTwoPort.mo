within DHN4Control.Interfaces;

partial model PartialTwoPort "Partial component with two ports"
  
  parameter Boolean allowFlowReversal = true "= false prohibits flow reversal, simplify the equations";
  
  DHN4Control.Interfaces.FluidPortInlet inlet annotation(
    Placement(visible = true, transformation(origin = {-100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 1.77636e-15}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  DHN4Control.Interfaces.FluidPortOutlet outlet annotation(
    Placement(visible = true, transformation(origin = {92, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -1.77636e-15}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));

end PartialTwoPort;
