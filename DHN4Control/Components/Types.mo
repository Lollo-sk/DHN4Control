within DHN4Control.Components;

package Types
  extends Modelica.Icons.TypesPackage;
  
  type valveOpeningChar = enumeration(
    Linear "Linear opening characteristic",
    Quadratic "Quadratic opening characteristic")
  "Enumeration to define the choice of valve flow coefficient";
end Types;
