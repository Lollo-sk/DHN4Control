within DHN4Control.Examples.Test;

model FixedReturnPowerLoadTest
  extends Modelica.Icons.Example;
  Sources.IdealMassFlowSource idealMassFlowSource annotation(
    Placement(visible = true, transformation(origin = {-68, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant massflow(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-102, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant temperature(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-130, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ExpansionTank sinkLP(p = 250000) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant returnRef(k = 75) annotation(
    Placement(visible = true, transformation(origin = {-42, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant loadProfile(k = -4186 * 5) annotation(
    Placement(visible = true, transformation(origin = {-10, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Sensors.IdealTemperatureSensor loadOutputTemperatureSensor annotation(
    Placement(visible = true, transformation(origin = {36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Loads.FixedReturnPowerLoad fixedReturnPowerLoad(Kv = 12, dp_nominale(displayUnit = "Pa") = 4e5)  annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(massflow.y, idealMassFlowSource.M) annotation(
    Line(points = {{-90, 18}, {-78, 18}}, color = {0, 0, 127}));
  connect(temperature.y, idealMassFlowSource.T) annotation(
    Line(points = {{-118, 2}, {-78, 2}}, color = {0, 0, 127}));
  connect(loadOutputTemperatureSensor.outlet, sinkLP.inlet) annotation(
    Line(points = {{46, 0}, {90, 0}}, color = {168, 168, 168}));
  connect(idealMassFlowSource.inlet, fixedReturnPowerLoad.inlet) annotation(
    Line(points = {{-68, 0}, {-20, 0}}, color = {168, 168, 168}));
  connect(fixedReturnPowerLoad.outlet, loadOutputTemperatureSensor.inlet) annotation(
    Line(points = {{0, 0}, {26, 0}}, color = {168, 168, 168}));
  connect(loadProfile.y, fixedReturnPowerLoad.loadConsumptionRef) annotation(
    Line(points = {{-10, 24}, {-10, 8}}, color = {0, 0, 127}));
  connect(returnRef.y, fixedReturnPowerLoad.valveRef) annotation(
    Line(points = {{-30, 20}, {-18, 20}, {-18, 6}}, color = {0, 0, 127}));  protected
  annotation(
    Diagram(coordinateSystem(extent = {{-140, 40}, {100, -20}})));
end FixedReturnPowerLoadTest;
