within DHN4Control.Components.Machines;

model ElectricBoiler
  "Model of an electric boiler, controlled through a On Off controller "
  extends DHN4Control.Interfaces.PartialTwoPort;
  Modelica.Blocks.Logical.OnOffController onOffController(bandwidth = deltaT) annotation(
    Placement(visible = true, transformation(origin = {-66, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoid(amplitude = Pmax, rising = Trise) annotation(
    Placement(visible = true, transformation(origin = {-30, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.BaseClass.PowerTransfer powerTransfer annotation(
    Placement(visible = true, transformation(origin = {-12, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Storage.LumpedStorage gasBoilerInnerVolume(D = D, T_ext = T_ext, T_start = T_start, dIns = 0.15, h = h, lambdaIns = 0.04) annotation(
    Placement(visible = true, transformation(origin = {38, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput referenceT annotation(
    Placement(visible = true, transformation(origin = {-112, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-34, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  connect(triggeredTrapezoid.y, powerTransfer.powerInput) annotation(
    Line(points = {{-19, 34}, {-14, 34}, {-14, 6}}, color = {0, 0, 127}));
  connect(onOffController.y, triggeredTrapezoid.u) annotation(
    Line(points = {{-55, 34}, {-43, 34}}, color = {255, 0, 255}));
  connect(inlet, powerTransfer.inlet) annotation(
    Line(points = {{-100, -2}, {-22, -2}}, color = {168, 168, 168}));
  connect(powerTransfer.outlet, gasBoilerInnerVolume.inlet) annotation(
    Line(points = {{-2, -2}, {28, -2}}, color = {168, 168, 168}));
  connect(gasBoilerInnerVolume.outlet, outlet) annotation(
    Line(points = {{48, -2}, {70, -2}, {70, -6}, {92, -6}}, color = {168, 168, 168}));
  connect(gasBoilerInnerVolume.temperatureMixVolume, onOffController.u) annotation(
    Line(points = {{46, 4}, {50, 4}, {50, 16}, {-90, 16}, {-90, 28}, {-78, 28}}, color = {0, 0, 127}));
  connect(referenceT, onOffController.reference) annotation(
    Line(points = {{-112, 40}, {-78, 40}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-120, 60}, {100, -20}})),
    Icon(graphics = {Rectangle(fillColor = {173, 173, 173}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(origin = {0, -54}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Text(origin = {1, 29}, extent = {{-55, 27}, {55, -27}}, textString = "OnOff
Boiler"), Polygon(origin = {2, -56}, lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}));
end ElectricBoiler;
