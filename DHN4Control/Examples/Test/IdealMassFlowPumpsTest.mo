within DHN4Control.Examples.Test;

model IdealMassFlowPumpsTest
  extends Modelica.Icons.Example;
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource annotation(
    Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant temperature(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-148, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank annotation(
    Placement(visible = true, transformation(origin = {74, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant massflow(k = 5) annotation(
    Placement(visible = true, transformation(origin = {-120, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank1 annotation(
    Placement(visible = true, transformation(origin = {72, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.FixedMassFlowPump fixedMassFlowPump annotation(
    Placement(visible = true, transformation(origin = {-6, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank2 annotation(
    Placement(visible = true, transformation(origin = {72, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.VariableMassFlowPump variableMassFlowPump annotation(
    Placement(visible = true, transformation(origin = {-6, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant variableMassRef(k = 2) annotation(
    Placement(visible = true, transformation(origin = {-44, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(massflow.y, idealMassFlowSource.M) annotation(
    Line(points = {{-108, 18}, {-90, 18}}, color = {0, 0, 127}));
  connect(temperature.y, idealMassFlowSource.T) annotation(
    Line(points = {{-136, 2}, {-90, 2}}, color = {0, 0, 127}));
  connect(idealMassFlowSource.inlet, expansionTank.inlet) annotation(
    Line(points = {{-80, 0}, {74, 0}}, color = {168, 168, 168}));
  connect(fixedMassFlowPump.outlet, expansionTank1.inlet) annotation(
    Line(points = {{4, -30}, {72, -30}, {72, -26}}, color = {168, 168, 168}));
  connect(idealMassFlowSource.inlet, fixedMassFlowPump.inlet) annotation(
    Line(points = {{-80, 0}, {-80, -30}, {-16, -30}}, color = {168, 168, 168}));
  connect(variableMassFlowPump.outlet, expansionTank2.inlet) annotation(
    Line(points = {{4, -60}, {72, -60}}, color = {168, 168, 168}));
  connect(variableMassFlowPump.inlet, idealMassFlowSource.inlet) annotation(
    Line(points = {{-16, -60}, {-80, -60}, {-80, 0}}, color = {168, 168, 168}));
  connect(variableMassRef.y, variableMassFlowPump.M) annotation(
    Line(points = {{-33, -48}, {-15, -48}, {-15, -54}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-160, 40}, {80, -80}})));
end IdealMassFlowPumpsTest;
