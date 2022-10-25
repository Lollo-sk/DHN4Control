# DHN4Control
Library for hydro-thermal simulations of district heating systems. Components' models are simplified to test, tune and analyze control strategies. Thanks to Prof. Francesco Casella for its help in the first set-up of the library and to professor Riccardo Scattolini for its help during the whole development of the research in the multi-energy fields.

# Modelica Version
The library is developed with Modelica 4.0.0

# Model approximations

- The fluid is incompressible, with constant specific heat capacity. Values for density and heat capacity are taken as the average between 30 to 90 degrees, which is the range of most common district heating applications.
- Height variations are neglected. We assume that the losses and gains of height variations balance out. Also, since the systems pressure losses are dominated by valves and controlled through pumps, the thermosiphon effect is neglected as well.
- Pipes are considered to be rigid, circular, with constant section. Computations about time delays are done through the finite volume method or the wave transport equation. Pressure losses are due to viscouse friction, computed with the a fixed funning factor considered at the working point and hight jumps. Flow is assumed to be turbulent, as in most applications of thermal heating.

# Citations
- Plug flow pipe model was taken from the AixLib: https://github.com/RWTH-EBC/AixLib 
- Pipe thermal inertia based on Thermopower: https://github.com/casella/ThermoPower
