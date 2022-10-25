within DHN4Control.Examples.Test;

model GasBoilerTest
  extends Modelica.Icons.Example;
  Components.ExpansionTank expansionTank annotation(
    Placement(visible = true, transformation(origin = {92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant temperature(k = 79) annotation(
    Placement(visible = true, transformation(origin = {-130, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant massflow(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-102, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.IdealMassFlowSource idealMassFlowSource annotation(
    Placement(visible = true, transformation(origin = {-68, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.IdealMassFlowSensor massFlowSensor annotation(
    Placement(visible = true, transformation(origin = {-46, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Tref(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-40, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sensors.IdealMassFlowSensor idealMassFlowSensor annotation(
    Placement(visible = true, transformation(origin = {-46, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 65) annotation(
    Placement(visible = true, transformation(origin = {-130, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank1 annotation(
    Placement(visible = true, transformation(origin = {92, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-40, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource1 annotation(
    Placement(visible = true, transformation(origin = {-68, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-102, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.IdealTemperatureSensor coldStartTSensor annotation(
    Placement(visible = true, transformation(origin = {32, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.IdealTemperatureSensor warmStartTSensor annotation(
    Placement(visible = true, transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.Machines.Boiler warmStart(T_start = 348.15)  annotation(
    Placement(visible = true, transformation(origin = {-4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.Machines.Boiler coldStartBoiler annotation(
    Placement(visible = true, transformation(origin = {-8, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(massflow.y, idealMassFlowSource.M) annotation(
    Line(points = {{-90, 18}, {-78, 18}}, color = {0, 0, 127}));
  connect(temperature.y, idealMassFlowSource.T) annotation(
    Line(points = {{-118, 2}, {-78, 2}}, color = {0, 0, 127}));
  connect(idealMassFlowSource.inlet, massFlowSensor.inlet) annotation(
    Line(points = {{-68, 0}, {-56, 0}}, color = {168, 168, 168}));
  connect(idealMassFlowSource1.inlet, idealMassFlowSensor.inlet) annotation(
    Line(points = {{-68, -42}, {-56, -42}}, color = {168, 168, 168}));
  connect(constant3.y, idealMassFlowSource1.M) annotation(
    Line(points = {{-91, -24}, {-79, -24}}, color = {0, 0, 127}));
  connect(constant1.y, idealMassFlowSource1.T) annotation(
    Line(points = {{-119, -40}, {-79, -40}}, color = {0, 0, 127}));
  connect(coldStartTSensor.outlet, expansionTank1.inlet) annotation(
    Line(points = {{42, -42}, {92, -42}}, color = {168, 168, 168}));
  connect(warmStartTSensor.outlet, expansionTank.inlet) annotation(
    Line(points = {{42, 0}, {92, 0}}, color = {168, 168, 168}));
  connect(massFlowSensor.outlet, warmStart.inlet) annotation(
    Line(points = {{-36, 0}, {-14, 0}}, color = {168, 168, 168}));
  connect(warmStart.outlet, warmStartTSensor.inlet) annotation(
    Line(points = {{6, 0}, {22, 0}}, color = {168, 168, 168}));
  connect(Tref.y, warmStart.T_Ref) annotation(
    Line(points = {{-28, 26}, {-12, 26}, {-12, 10}}, color = {0, 0, 127}));
  connect(idealMassFlowSensor.outlet, coldStartBoiler.inlet) annotation(
    Line(points = {{-36, -42}, {-18, -42}}, color = {168, 168, 168}));
  connect(coldStartBoiler.outlet, coldStartTSensor.inlet) annotation(
    Line(points = {{2, -42}, {22, -42}}, color = {168, 168, 168}));
  connect(constant2.y, coldStartBoiler.T_Ref) annotation(
    Line(points = {{-28, -24}, {-16, -24}, {-16, -32}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-140, 40}, {100, -60}})));
end GasBoilerTest;
