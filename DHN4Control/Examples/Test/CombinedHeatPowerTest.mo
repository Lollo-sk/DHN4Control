within DHN4Control.Examples.Test;

model CombinedHeatPowerTest
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant temperature(k = 70) annotation(
    Placement(visible = true, transformation(origin = {-130, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.IdealMassFlowSource idealMassFlowSource annotation(
    Placement(visible = true, transformation(origin = {-68, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ExpansionTank expansionTank annotation(
    Placement(visible = true, transformation(origin = {92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.IdealMassFlowSensor massFlowSensor annotation(
    Placement(visible = true, transformation(origin = {-46, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant massflow(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-102, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Tref(k = 10 *4186 * 0.4 / 0.5) annotation(
    Placement(visible = true, transformation(origin = {-40, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.IdealTemperatureSensor warmStartTSensor annotation(
    Placement(visible = true, transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Machines.CombinedHeatPower combinedHeatPower(eta_electrical = 0.4, eta_thermal = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-12, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(massflow.y, idealMassFlowSource.M) annotation(
    Line(points = {{-90, 18}, {-78, 18}}, color = {0, 0, 127}));
  connect(temperature.y, idealMassFlowSource.T) annotation(
    Line(points = {{-118, 2}, {-78, 2}}, color = {0, 0, 127}));
  connect(idealMassFlowSource.inlet, massFlowSensor.inlet) annotation(
    Line(points = {{-68, 0}, {-56, 0}}, color = {168, 168, 168}));
  connect(warmStartTSensor.outlet, expansionTank.inlet) annotation(
    Line(points = {{42, 0}, {92, 0}}, color = {168, 168, 168}));
  connect(massFlowSensor.outlet, combinedHeatPower.inlet) annotation(
    Line(points = {{-36, 0}, {-22, 0}}, color = {168, 168, 168}));
  connect(combinedHeatPower.outlet, warmStartTSensor.inlet) annotation(
    Line(points = {{-2, 0}, {22, 0}}, color = {168, 168, 168}));
  connect(Tref.y, combinedHeatPower.PelectricRef) annotation(
    Line(points = {{-28, 26}, {-20, 26}, {-20, 10}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-140, 40}, {100, -20}})));
end CombinedHeatPowerTest;
