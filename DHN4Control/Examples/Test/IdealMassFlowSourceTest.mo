within DHN4Control.Examples.Test;

model IdealMassFlowSourceTest
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant massflow(k = 5) annotation(
    Placement(visible = true, transformation(origin = {-102, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant temperature(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-130, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ExpansionTank expansionTank annotation(
    Placement(visible = true, transformation(origin = {92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource annotation(
    Placement(visible = true, transformation(origin = {-68, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(idealMassFlowSource.inlet, expansionTank.inlet) annotation(
    Line(points = {{-68, 0}, {92, 0}}, color = {168, 168, 168}));
  connect(massflow.y, idealMassFlowSource.M) annotation(
    Line(points = {{-90, 18}, {-78, 18}}, color = {0, 0, 127}));
  connect(temperature.y, idealMassFlowSource.T) annotation(
    Line(points = {{-118, 2}, {-78, 2}}, color = {0, 0, 127}));
protected
end IdealMassFlowSourceTest;
