within DHN4Control.Components.Pipes.BaseClass;

model ThermalInertiaPlugFlow
  extends DHN4Control.Components.BaseClass.PartialLumpedVolume;
equation
  // No pressure loss
  inlet.p = outlet.p;
  // No losses towards the ambient, already computed
  Q_amb = 0;
end ThermalInertiaPlugFlow;
