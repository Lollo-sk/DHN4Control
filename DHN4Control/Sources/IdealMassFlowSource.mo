within DHN4Control.Sources;

model IdealMassFlowSource "Generate a fixed mass flow rate at a temperature given from outside"
    extends DHN4Control.Interfaces.PartialOnePort;
    import DHN4Control.Media.{cp, rho0};
    Modelica.Blocks.Interfaces.RealInput M "Output mass flow" annotation(
      Placement(visible = true, transformation(origin = {-108, 26}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-98, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput T "Temperature in Celsius" annotation(
      Placement(visible = true, transformation(origin = {-98, 26}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-98, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
    inlet.m_flow = -M;
    inlet.h_out = cp * (T+273.16);
    annotation(
      Icon(graphics = {Ellipse(extent = {{-100, 100}, {100, -100}}), Text(origin = {-3, 1}, extent = {{-71, 31}, {71, -31}}, textString = "%name")}));
end IdealMassFlowSource;
