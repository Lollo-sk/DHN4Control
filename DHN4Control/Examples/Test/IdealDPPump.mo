within DHN4Control.Examples.Test;

model IdealDPPump
  extends Modelica.Icons.Example;
  DHN4Control.Components.ExpansionTank sinkLP(p = 399999.9999999999)  annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.FixedDifferentialPressurePump fixedDifferentialPressurePump(Dp = 99999.99999999999)  annotation(
    Placement(visible = true, transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.IdealMassFlowSource idealMassFlowSource annotation(
    Placement(visible = true, transformation(origin = {-68, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant temperature(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-130, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant massflow(k = 5) annotation(
    Placement(visible = true, transformation(origin = {-102, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.VariableDifferentialPressurePump variableDifferentialPressurePump annotation(
    Placement(visible = true, transformation(origin = {-22, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank sinkHP(p = 999999.9999999999) annotation(
    Placement(visible = true, transformation(origin = {90, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-142, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource1 annotation(
    Placement(visible = true, transformation(origin = {-80, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 5) annotation(
    Placement(visible = true, transformation(origin = {-114, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 8, height = 8e5, offset = 1e5, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-48, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedDifferentialPressurePump.outlet, sinkLP.inlet) annotation(
    Line(points = {{-14, 0}, {90, 0}}, color = {168, 168, 168}));
  connect(temperature.y, idealMassFlowSource.T) annotation(
    Line(points = {{-118, 2}, {-78, 2}}, color = {0, 0, 127}));
  connect(massflow.y, idealMassFlowSource.M) annotation(
    Line(points = {{-90, 18}, {-78, 18}}, color = {0, 0, 127}));
  connect(idealMassFlowSource.inlet, fixedDifferentialPressurePump.inlet) annotation(
    Line(points = {{-68, 0}, {-34, 0}}, color = {168, 168, 168}));
  connect(sinkHP.inlet, variableDifferentialPressurePump.outlet) annotation(
    Line(points = {{90, -52}, {-12, -52}}, color = {168, 168, 168}));
  connect(constant1.y, idealMassFlowSource1.T) annotation(
    Line(points = {{-131, -50}, {-91, -50}}, color = {0, 0, 127}));
  connect(constant2.y, idealMassFlowSource1.M) annotation(
    Line(points = {{-103, -34}, {-91, -34}}, color = {0, 0, 127}));
  connect(idealMassFlowSource1.inlet, variableDifferentialPressurePump.inlet) annotation(
    Line(points = {{-80, -52}, {-32, -52}}, color = {168, 168, 168}));
  connect(ramp.y, variableDifferentialPressurePump.Dp) annotation(
    Line(points = {{-36, -30}, {-30, -30}, {-30, -46}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-140, 40}, {100, -60}})));
end IdealDPPump;
