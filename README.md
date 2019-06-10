# Numerics and Flow Simulation
## Description
Basic 2D flow solver using Matlab developed as an assignment from the course Numerics and Flow Simulation offered by Prof. Dr. Andreas Kempf of the University Duisburg-Essen\
Link: https://www.uni-due.de/ivg/fluiddynamik/en/index_en.php

## Examples
### CDS (Central Differencing Scheme)
 - The CDS Scheme is second order accurate but unstable with explicit Euler Time-Integration
 - This scheme exhibits strong oscillations as seen below

<img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_CDS1.png" alt="DiagFlow0" width="300" height="300"><img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_CDS2.png" alt="DiagFlow1" width="300" height="300">

<img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_CDS3.png" alt="DiagFlow0" width="300" height="300"><img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_CDS4.png" alt="DiagFlow1" width="300" height="300">


### USCDS (Upwind Shifted Central Differencing Scheme)
 - A non-standard "educational" scheme that works with reasonable accuracy for explicit Euler Time-Integration (Kempf)
 - Point where fluxees are discretised is shifted upstream (assumes constant velocity!)
 - USCDS CANNOT consider changes in velocity field or diffusive fluxes
 
<img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_USCDS1.png" alt="DiagFlow0" width="300" height="300"><img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_USCDS2.png" alt="DiagFlow1" width="300" height="300">


<img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_USCDS3.png" alt="DiagFlow2" width="300" height="300"><img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_USCDS4.png" alt="DiagFlow3" width="300" height="300">
