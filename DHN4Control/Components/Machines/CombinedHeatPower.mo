within DHN4Control.Components.Machines;

model CombinedHeatPower
  extends DHN4Control.Interfaces.PartialTwoPort;
  
  parameter Real P_init=25e3 "Initial electrical power production";
  parameter Real eta_electrical = 0.4193 "Average electrical efficiency";
  parameter Real eta_thermal = 0.5453 "Average thermal efficiency";
  parameter Real tau_chp = 26.09 "CHP time constant";
  
  Modelica.Blocks.Interfaces.RealInput PelectricRef annotation(
    Placement(visible = true, transformation(origin = {-106, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constantElectricEfficience(k = eta_electrical) annotation(
    Placement(visible = true, transformation(origin = {-56, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constantThermalEfficience(k = eta_thermal) annotation(
    Placement(visible = true, transformation(origin = {64, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.TransferFunction chpDelay(a = {tau_chp, 1}, b = {1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = P_init) annotation(
    Placement(visible = true, transformation(origin = {-64, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division totalPowerConsumption annotation(
    Placement(visible = true, transformation(origin = {0, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {22, 36}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DHN4Control.Components.BaseClass.PowerTransfer chpHeatHX annotation(
    Placement(visible = true, transformation(origin = {24, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(totalPowerConsumption.y, product.u2) annotation(
    Line(points = {{11, 62}, {16, 62}, {16, 48}}, color = {0, 0, 127}));
  connect(constantElectricEfficience.y, totalPowerConsumption.u2) annotation(
    Line(points = {{-44, 56}, {-12, 56}}, color = {0, 0, 127}));
  connect(chpDelay.y, totalPowerConsumption.u1) annotation(
    Line(points = {{-52, 90}, {-12, 90}, {-12, 68}}, color = {0, 0, 127}));
  connect(constantThermalEfficience.y, product.u1) annotation(
    Line(points = {{54, 60}, {28, 60}, {28, 48}}, color = {0, 0, 127}));
  connect(PelectricRef, chpDelay.u) annotation(
    Line(points = {{-106, 90}, {-76, 90}}, color = {0, 0, 127}));
  connect(inlet, chpHeatHX.inlet) annotation(
    Line(points = {{-100, -2}, {14, -2}}, color = {168, 168, 168}));
  connect(chpHeatHX.outlet, outlet) annotation(
    Line(points = {{34, -2}, {92, -2}, {92, -6}}, color = {168, 168, 168}));
  connect(product.y, chpHeatHX.powerInput) annotation(
    Line(points = {{22, 26}, {22, 6}}, color = {0, 0, 127}));
  annotation(
    Icon(graphics = {Rectangle(origin = {-4, 0}, fillColor = {171, 171, 171}, fillPattern = FillPattern.Solid, extent = {{-84, 100}, {84, -100}}), Ellipse(origin = {0, -48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Polygon(origin = {-1, -45}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points = {{-21, -37}, {-27, -3}, {-21, -13}, {-19, 25}, {-11, 13}, {1, 37}, {13, 13}, {19, 25}, {23, -15}, {27, -5}, {21, -37}, {1, -43}, {-21, -37}}), Polygon(origin = {-1, -45}, lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-15, -37}, {-23, -13}, {-15, -17}, {-15, 3}, {-9, -1}, {1, 25}, {9, -1}, {15, 3}, {17, -17}, {23, -13}, {15, -37}, {1, -43}, {-15, -37}}), Ellipse(origin = {0, 50}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Polygon(origin = {0, 50}, lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}),
    Diagram(coordinateSystem(extent = {{-140, 120}, {100, -20}})));
end CombinedHeatPower;
