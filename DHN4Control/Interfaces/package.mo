within DHN4Control;

package Interfaces "Definition of the base connector and ports"
  extends Modelica.Icons.InterfacesPackage;

  connector FluidPort "Generic fluid port"
    Modelica.Units.SI.Pressure p "Absolute pressure";
    flow Modelica.Units.SI.MassFlowRate m_flow "Mass flow rate";
    stream Modelica.Units.SI.SpecificEnthalpy h_out "Outgoing specific enthalpy";
  end FluidPort;

  connector FluidPortInlet "Conventional inlet port"
    extends FluidPort;
    annotation(
      Icon(graphics = {Ellipse(lineColor = {168, 168, 168}, fillColor = {168, 168, 168}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
  end FluidPortInlet;

  connector FluidPortOutlet "Conventional outlet port"
    extends FluidPort;
    annotation(
      Icon(graphics = {Ellipse(lineColor = {168, 168, 168}, fillColor = {168, 168, 168}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}})}));
  end FluidPortOutlet;
end Interfaces;
