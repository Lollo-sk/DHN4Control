within DHN4Control.Examples.Test;

model PipeTest
  extends Modelica.Icons.Example;
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource annotation(
    Placement(visible = true, transformation(origin = {-68, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant massflow(k = 5) annotation(
    Placement(visible = true, transformation(origin = {-102, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant temperature(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-130, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank annotation(
    Placement(visible = true, transformation(origin = {92, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.Pipes.pipeFV oneSec(D = 0.0508, L = 50, N = 1, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, dIns = 0.1, dWall = 0.003, h = 10, lambdaIns = 0.04)  annotation(
    Placement(visible = true, transformation(origin = {-12, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.Pipes.pipeFV fiftySec(D = 0.0508, L = 50, N = 50, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, dIns = 0.1, dWall = 0.003, lambdaIns = 0.04) annotation(
    Placement(visible = true, transformation(origin = {-12, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 5) annotation(
    Placement(visible = true, transformation(origin = {-102, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank1 annotation(
    Placement(visible = true, transformation(origin = {92, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-130, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource1 annotation(
    Placement(visible = true, transformation(origin = {-68, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.Pipes.pipeFV fiftySecNoTI(D = 0.0508, L = 50, N = 50, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, dIns = 0.1, dWall = 0.003, lambdaIns = 0.04, thermalInertia = false) annotation(
    Placement(visible = true, transformation(origin = {-12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = 80) annotation(
    Placement(visible = true, transformation(origin = {-130, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank2 annotation(
    Placement(visible = true, transformation(origin = {92, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource2 annotation(
    Placement(visible = true, transformation(origin = {-68, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant4(k = 5) annotation(
    Placement(visible = true, transformation(origin = {-102, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SimpleDistricHeating.Components.Sources.IdealMassFlowSource idealMassFlowSource3 annotation(
    Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant5(k = 5) annotation(
    Placement(visible = true, transformation(origin = {-116, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SimpleDistricHeating.Components.PressureAccumulator pressureAccumulator annotation(
    Placement(visible = true, transformation(origin = {84, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SimpleDistricHeating.Components.PipeTI fiftySecOLD(D = 0.0508, L = 50, N = 50, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, UA = 14.1) annotation(
    Placement(visible = true, transformation(origin = {2, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 80 + 273.16) annotation(
    Placement(visible = true, transformation(origin = {-144, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(temperature.y, idealMassFlowSource.T) annotation(
    Line(points = {{-119, 62}, {-79, 62}}, color = {0, 0, 127}));
  connect(massflow.y, idealMassFlowSource.M) annotation(
    Line(points = {{-91, 78}, {-79, 78}}, color = {0, 0, 127}));
  connect(idealMassFlowSource.inlet, oneSec.inlet) annotation(
    Line(points = {{-68, 60}, {-22, 60}}));
  connect(oneSec.outlet, expansionTank.inlet) annotation(
    Line(points = {{-2, 60}, {92, 60}}));
  connect(fiftySec.outlet, expansionTank1.inlet) annotation(
    Line(points = {{-2, 20}, {92, 20}}));
  connect(constant1.y, idealMassFlowSource1.M) annotation(
    Line(points = {{-91, 38}, {-79, 38}}, color = {0, 0, 127}));
  connect(idealMassFlowSource1.inlet, fiftySec.inlet) annotation(
    Line(points = {{-68, 20}, {-22, 20}}));
  connect(constant2.y, idealMassFlowSource1.T) annotation(
    Line(points = {{-119, 22}, {-79, 22}}, color = {0, 0, 127}));
  connect(fiftySecNoTI.outlet, expansionTank2.inlet) annotation(
    Line(points = {{-2, -20}, {92, -20}}));
  connect(idealMassFlowSource2.inlet, fiftySecNoTI.inlet) annotation(
    Line(points = {{-68, -20}, {-22, -20}}));
  connect(constant3.y, idealMassFlowSource2.T) annotation(
    Line(points = {{-119, -18}, {-79, -18}}, color = {0, 0, 127}));
  connect(constant4.y, idealMassFlowSource2.M) annotation(
    Line(points = {{-91, -2}, {-79, -2}}, color = {0, 0, 127}));
  connect(constant5.y, idealMassFlowSource3.massFlow) annotation(
    Line(points = {{-105, -52}, {-83, -52}}, color = {0, 0, 127}));
  connect(idealMassFlowSource3.outlet, fiftySecOLD.inlet) annotation(
    Line(points = {{-62, -60}, {-6, -60}}, color = {168, 168, 168}));
  connect(fiftySecOLD.outlet, pressureAccumulator.fluidPort) annotation(
    Line(points = {{10, -60}, {84, -60}}, color = {168, 168, 168}));
  connect(const.y, idealMassFlowSource3.T) annotation(
    Line(points = {{-133, -58}, {-82, -58}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-160, 100}, {100, -80}})));
end PipeTest;
