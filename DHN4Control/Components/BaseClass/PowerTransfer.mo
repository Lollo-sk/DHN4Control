within DHN4Control.Components.BaseClass;

model PowerTransfer
  "Model a imposed power loss to the fluid, with no pressure loss"
  extends DHN4Control.Interfaces.PartialTwoPort;
  
  parameter Modelica.Units.SI.MassFlowRate b = 0.001 "Regularization mass flow rate, avoid null division. Try to keep it low in accordance to the expected mass flow.";
  
  Modelica.Blocks.Interfaces.RealInput powerInput "Power entering the component. " annotation(
    Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-20, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  // Momentum balance
  inlet.p - outlet.p = 0;
  // Energy balance
  inStream(inlet.h_out) + powerInput / max(inlet.m_flow, b) = outlet.h_out;
  inlet.h_out = inStream(outlet.h_out) + powerInput / max(outlet.m_flow, b);
annotation(
    Icon(graphics = {Rectangle(lineColor = {173, 173, 173}, lineThickness = 3, extent = {{-100, 80}, {100, -80}}), Line(origin = {0, -0.81}, points = {{-100, -0.102339}, {-52, -0.102339}, {-30, 39.8977}, {0, -40.1023}, {30, 39.8977}, {54, -0.102339}, {100, -0.102339}}, color = {0, 0, 255}, thickness = 1.75)}));
end PowerTransfer;
