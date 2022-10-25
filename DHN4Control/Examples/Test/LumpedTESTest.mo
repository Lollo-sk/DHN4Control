within DHN4Control.Examples.Test;

model LumpedTESTest
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant temperature(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-130, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant massflow(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-102, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource annotation(
    Placement(visible = true, transformation(origin = {-68, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ExpansionTank expansionTank(T = 353.15)  annotation(
    Placement(visible = true, transformation(origin = {92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SimpleDistricHeating.Components.TES tes(D = 1.7, T_amb = 298.15, T_start = 338.15, dIns = 0.04, h = 5, lambda = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 10) annotation(
    Placement(visible = true, transformation(origin = {-106, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource1 annotation(
    Placement(visible = true, transformation(origin = {-72, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-134, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank1 annotation(
    Placement(visible = true, transformation(origin = {66, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  extends Modelica.Icons.Example;
  extends Modelica.Icons.Example;
  extends Modelica.Icons.Example;
  extends Modelica.Icons.Example;
  extends Modelica.Icons.Example;
  extends Modelica.Icons.Example;
  extends Modelica.Icons.Example;
  Components.Storage.LumpedStorage lumpedStorage(D = 1.7, T_ext = 298.15, T_start = 338.15, h = 5)  annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(massflow.y, idealMassFlowSource.M) annotation(
    Line(points = {{-91, 18}, {-78, 18}}, color = {0, 0, 127}));
  connect(temperature.y, idealMassFlowSource.T) annotation(
    Line(points = {{-119, 2}, {-78, 2}}, color = {0, 0, 127}));
  connect(constant2.y, idealMassFlowSource1.T) annotation(
    Line(points = {{-123, -46}, {-82, -46}}, color = {0, 0, 127}));
  connect(constant1.y, idealMassFlowSource1.M) annotation(
    Line(points = {{-95, -30}, {-82, -30}}, color = {0, 0, 127}));
  connect(idealMassFlowSource1.inlet, tes.outlet) annotation(
    Line(points = {{-72, -48}, {0, -48}, {0, -50}}, color = {168, 168, 168}));
  connect(tes.inlet, expansionTank1.inlet) annotation(
    Line(points = {{0, -70}, {0, -80}, {66, -80}}, color = {168, 168, 168}));
  connect(idealMassFlowSource.inlet, lumpedStorage.inlet) annotation(
    Line(points = {{-68, 0}, {-30, 0}}, color = {168, 168, 168}));
  connect(lumpedStorage.outlet, expansionTank.inlet) annotation(
    Line(points = {{-10, 0}, {92, 0}}, color = {168, 168, 168}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-160, 40}, {100, -80}})));
end LumpedTESTest;
