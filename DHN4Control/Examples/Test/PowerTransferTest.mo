within DHN4Control.Examples.Test;

model PowerTransferTest
  extends Modelica.Icons.Example;
  Components.ExpansionTank expansionTank annotation(
    Placement(visible = true, transformation(origin = {92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant temperature(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-130, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant massflow(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-102, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.IdealMassFlowSource idealMassFlowSource annotation(
    Placement(visible = true, transformation(origin = {-68, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.BaseClass.PowerTransfer inputPower annotation(
    Placement(visible = true, transformation(origin = {-6, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-102, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-130, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank1 annotation(
    Placement(visible = true, transformation(origin = {92, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.BaseClass.PowerTransfer outputPower annotation(
    Placement(visible = true, transformation(origin = {-6, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource1 annotation(
    Placement(visible = true, transformation(origin = {-68, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = 4186 * 5) annotation(
    Placement(visible = true, transformation(origin = {-38, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = -4186 * 5) annotation(
    Placement(visible = true, transformation(origin = {-38, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.IdealTemperatureSensor hotter annotation(
    Placement(visible = true, transformation(origin = {38, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sensors.IdealTemperatureSensor colder annotation(
    Placement(visible = true, transformation(origin = {36, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant4(k = -4186 * 5) annotation(
    Placement(visible = true, transformation(origin = {-38, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource2 annotation(
    Placement(visible = true, transformation(origin = {-68, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank2 annotation(
    Placement(visible = true, transformation(origin = {92, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant5(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-102, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant6(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-130, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sensors.IdealTemperatureSensor idealTemperatureSensor annotation(
    Placement(visible = true, transformation(origin = {36, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.BaseClass.PowerTransfer powerTransfer annotation(
    Placement(visible = true, transformation(origin = {-6, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(massflow.y, idealMassFlowSource.M) annotation(
    Line(points = {{-90, 18}, {-78, 18}}, color = {0, 0, 127}));
  connect(temperature.y, idealMassFlowSource.T) annotation(
    Line(points = {{-118, 2}, {-78, 2}}, color = {0, 0, 127}));
  connect(idealMassFlowSource.inlet, inputPower.inlet) annotation(
    Line(points = {{-68, 0}, {-16, 0}}, color = {168, 168, 168}));
  connect(idealMassFlowSource1.inlet, outputPower.inlet) annotation(
    Line(points = {{-68, -40}, {-16, -40}}, color = {168, 168, 168}));
  connect(constant1.y, idealMassFlowSource1.M) annotation(
    Line(points = {{-91, -22}, {-79, -22}}, color = {0, 0, 127}));
  connect(constant2.y, idealMassFlowSource1.T) annotation(
    Line(points = {{-119, -38}, {-79, -38}}, color = {0, 0, 127}));
  connect(constant3.y, inputPower.powerInput) annotation(
    Line(points = {{-26, 24}, {-8, 24}, {-8, 8}}, color = {0, 0, 127}));
  connect(const.y, outputPower.powerInput) annotation(
    Line(points = {{-26, -18}, {-8, -18}, {-8, -32}}, color = {0, 0, 127}));
  connect(inputPower.outlet, hotter.inlet) annotation(
    Line(points = {{4, 0}, {28, 0}}, color = {168, 168, 168}));
  connect(hotter.outlet, expansionTank.inlet) annotation(
    Line(points = {{48, 0}, {92, 0}}, color = {168, 168, 168}));
  connect(outputPower.outlet, colder.inlet) annotation(
    Line(points = {{4, -40}, {26, -40}}, color = {168, 168, 168}));
  connect(colder.outlet, expansionTank1.inlet) annotation(
    Line(points = {{46, -40}, {92, -40}}, color = {168, 168, 168}));
  connect(idealTemperatureSensor.outlet, expansionTank2.inlet) annotation(
    Line(points = {{46, -80}, {92, -80}}, color = {168, 168, 168}));
  connect(constant5.y, idealMassFlowSource2.M) annotation(
    Line(points = {{-91, -62}, {-79, -62}}, color = {0, 0, 127}));
  connect(constant6.y, idealMassFlowSource2.T) annotation(
    Line(points = {{-119, -78}, {-79, -78}}, color = {0, 0, 127}));
  connect(powerTransfer.inlet, idealTemperatureSensor.inlet) annotation(
    Line(points = {{4, -80}, {26, -80}}, color = {168, 168, 168}));
  connect(idealMassFlowSource2.inlet, powerTransfer.outlet) annotation(
    Line(points = {{-68, -80}, {-16, -80}}, color = {168, 168, 168}));
  connect(constant4.y, powerTransfer.powerInput) annotation(
    Line(points = {{-27, -98}, {-5, -98}, {-5, -88}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-140, 40}, {100, -120}})));
end PowerTransferTest;
