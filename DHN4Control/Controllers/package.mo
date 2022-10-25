within DHN4Control;

package Controllers "Package containing simple controls ready to be implemented"
  extends Modelica.Icons.Package;
  
  model AWPIContinuous
  
    parameter Real Kp = 1 "Proportional gain";
    parameter Real Ti = 1 "Integral Time";
    parameter Real Umax = 1 "Maximum control action";
    parameter Real Umin = 0 "Minimum control action";
    Modelica.Blocks.Interfaces.RealInput REF annotation(
        Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-86, 38}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput FeedBack annotation(
          Placement(visible = true, transformation(origin = {-100, -32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-86, -30}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput controlAction annotation(
          Placement(visible = true, transformation(origin = {110, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {86, 0}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback annotation(
          Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain(k = Kp)  annotation(
          Placement(visible = true, transformation(origin = {-14, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add(k1 = +1, k2 = +1)  annotation(
          Placement(visible = true, transformation(origin = {24, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter(uMax = Umax, uMin = Umin)  annotation(
          Placement(visible = true, transformation(origin = {62, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(T = Ti, initType = Modelica.Blocks.Types.Init.NoInit, k = 1)  annotation(
          Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  equation
    connect(REF, feedback.u1) annotation(
          Line(points = {{-100, 40}, {-58, 40}}, color = {0, 0, 127}));
    connect(FeedBack, feedback.u2) annotation(
          Line(points = {{-100, -32}, {-50, -32}, {-50, 32}}, color = {0, 0, 127}));
    connect(feedback.y, gain.u) annotation(
          Line(points = {{-40, 40}, {-26, 40}}, color = {0, 0, 127}));
    connect(gain.y, add.u1) annotation(
          Line(points = {{-2, 40}, {12, 40}}, color = {0, 0, 127}));
    connect(add.y, limiter.u) annotation(
          Line(points = {{36, 34}, {50, 34}}, color = {0, 0, 127}));
    connect(limiter.y, controlAction) annotation(
          Line(points = {{74, 34}, {110, 34}}, color = {0, 0, 127}));
    connect(limiter.y, firstOrder.u) annotation(
          Line(points = {{74, 34}, {74, -10}, {62, -10}}, color = {0, 0, 127}));
    connect(firstOrder.y, add.u2) annotation(
          Line(points = {{40, -10}, {0, -10}, {0, 28}, {12, 28}}, color = {0, 0, 127}));
    annotation(
        Icon(graphics = {Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 60}, {100, -60}}), Text(extent = {{-38, 12}, {38, -12}}, textString = "PI AW")}),
        Diagram(coordinateSystem(extent = {{-120, 60}, {120, -60}})));
  end AWPIContinuous;
      
  model P
    parameter Real Kp = 1 "proportional gain";
    parameter Real Umax = 1;
    parameter Real Umin = 0;
  
    Modelica.Blocks.Interfaces.RealOutput controlAction annotation(
      Placement(visible = true, transformation(origin = {106, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{80, -10}, {100, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput REF annotation(
      Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(extent = {{-100, -60}, {-60, -20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput FeedBack annotation(
      Placement(visible = true, transformation(origin = {-100, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(extent = {{-100, 18}, {-60, 58}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain(k = Kp) annotation(
        Placement(visible = true, transformation(origin = {-14, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback annotation(
        Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter(uMax = Umax, uMin = Umin) annotation(
        Placement(visible = true, transformation(origin = {34, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(feedback.y, gain.u) annotation(
      Line(points = {{-40, 40}, {-26, 40}}, color = {0, 0, 127}));
    connect(REF, feedback.u1) annotation(
      Line(points = {{-100, 40}, {-58, 40}}, color = {0, 0, 127}));
    connect(FeedBack, feedback.u2) annotation(
      Line(points = {{-100, 2}, {-100, 1}, {-50, 1}, {-50, 32}}, color = {0, 0, 127}));
    connect(gain.y, limiter.u) annotation(
      Line(points = {{-2, 40}, {22, 40}}, color = {0, 0, 127}));
    connect(limiter.y, controlAction) annotation(
      Line(points = {{46, 40}, {106, 40}}, color = {0, 0, 127}));
    annotation(
      Diagram,
      Icon(graphics = {Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 60}, {100, -60}}), Text(origin = {1, -1}, extent = {{-17, 13}, {17, -13}}, textString = "P")}));
  end P;
  annotation(
    Icon(graphics = {Line(origin = {-51.25, 0}, points = {{21.25, -35}, {-13.75, -35}, {-13.75, 35}, {6.25, 35}}), Rectangle(origin = {0, -34.8512}, fillColor = {255, 255, 255}, extent = {{-30, -20.1488}, {30, 20.1488}}), Line(origin = {51.25, 0}, points = {{-21.25, 35}, {13.75, 35}, {13.75, -35}, {-6.25, -35}}), Polygon(origin = {-40, 35}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{10, 0}, {-5, 5}, {-5, -5}, {10, 0}}), Polygon(origin = {40, -35}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-10, 0}, {5, 5}, {5, -5}, {-10, 0}}), Rectangle(origin = {0, 35.1488}, fillColor = {255, 255, 255}, extent = {{-30, -20.1488}, {30, 20.1488}})}));
    
end Controllers;
