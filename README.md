# TEMOA-Italy
## Critical Raw Materials

The 'materials' branch of TEMOA-Italy includes the value chain of selected raw materials from the Critical Raw Materials (CRMs) list of the European Commission published in 2023 [1]. The modeling of CRMs value chain encompasses the following novelties: a new commodity type modeling the single CRM, which can be provided in the energy system by generic supply process; three equations modeling consumption, balance, and maximum availability of the CRM; a variable and a parameter to track the consumption of the CRM and a parameter to set a maximum material availability.

The consumption of a material "V_MatCons" is evaluated through the equation "MaterialConsumption_Constraint" by technology and occurs when the technology is installed. It is computed by multiplying the newly installed capacity by a new parameter measuring the material intensity "MaterialIntensity". The latter is a specific material consumption defined in unit mass of the material per unit capacity of the technology requiring the material). Then, as for the energy commodities, the material commodities are subject to a balance constraint "MaterialBalance_Constraint" to ensure a system level balance. Finally, a maximum availability constraint "MaxMaterialReserve_Constraint" is applied to the materials supply processes to set the maximum value "MaxMaterialReserve" that can be reached over the entire model time horizon.

For more details about the actual implementation in TEMOA, see [2], [3], [4].

## References
1. European Commission, “Study on the critical raw materials for the EU 2023 : final report.,” 2023. doi: 10.2873/725585.
2. G. Colucci, V. Bertsch, V. Di Cosmo, J. Finke, and L. Savoldi, “Combined assessment of material and energy supply risks of the energy transition: a multi-objective energy system optimization approach,” Submitted to Applied Energy, 2024.
3. A. Vai, “How may the availability of critical raw materials affect the deployment of material-intensive technologies and the security of energy systems?,” Politecnico di Torino, Turin, 2024. Accessed: Aug. 13, 2024. [Online]. Available: https://webthesis.biblio.polito.it/31959/
4. A. Vai, C. Gianvito, N. Matteo, and S. Laura, “May the availability of critical raw materials affect the security of energy systems? An analysis for risk-aware energy planning with TEMOA-Italy,” Submitted to Materials Today Energy, 2024.

## Contribution

The developing team wishes to receive help form the users in the definition and test of new test cases, in the benchmark against other established software, in the inclusion of other functionalities.
To contribute please refer to [contribution](CONTRIBUTION.md).

## Code of Conduct

The developing team agreed to embrace the [![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md) **Code of Conduct**.
 
## License
TEMOA-Italy is licensed under [![AGPL](https://www.gnu.org/graphics/agplv3-with-text-100x42.png)](LICENSE) or any other version of it.
