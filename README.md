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


### UDS (Upwind Discretisation Scheme)
 - The UDS Scheme uses the upstream value
 - The UDS Scheme is only first order accurate, very dissipative but very stable

<img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_UDS1.png" alt="DiagFlow0" width="300" height="300"><img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_UDS2.png" alt="DiagFlow1" width="300" height="300">

<img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_UDS3.png" alt="DiagFlow0" width="300" height="300"><img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_UDS4.png" alt="DiagFlow1" width="300" height="300">


### TVD-Smart (Total Variation Diminuishing, SMART Scheme)
 - TVD Schemes blend CDS and UDS to remain accurate and avoid wiggles
 - Example here, uses the SMART Scheme

<img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_TVD_Smart1.png" alt="DiagFlow0" width="300" height="300"><img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_TVD_Smart2.png" alt="DiagFlow1" width="300" height="300">

<img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_TVD_Smart3.png" alt="DiagFlow0" width="300" height="300"><img src="https://github.com/RenZhen95/NumericsAndFlowSimulation/blob/master/Images/DiagJet_TVD_Smart4.png" alt="DiagFlow1" width="300" height="300">
