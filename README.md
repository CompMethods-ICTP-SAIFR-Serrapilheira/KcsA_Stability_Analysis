# KcsA Stability Analysis

**Author: Julietta Sophia Mendivelso**

This project presents a simple stability analysis of the KcsA membrane protein when is embedded in a POPC (1-palmitoyl-2-oleoyl-sn-glycero-3-phosphocholine) membrane.

## Motivation
The KcsA (K channel of streptomyces A) membrane protein, an archetypal potassium channel with very interesting properties, was the first ion channel to be characterized using X-ray crystallography. The channel itself is a tetramer composed of four identical, single-domain subunits.

KcsA belongs to a family of channels found in almost all organisms and it is one of the most studied ion channels to this day. Research on KcsA has provided important insight on the molecular basis for K+ ion; as a result, KcsA is a template for research on K+ channel function and its elucidated structure underlies computational modeling of channel dynamics for both prokaryotic and eukaryotic species. Studying its behavior in different scenarios 


## Methods
The tertiary structure of KcsA was obtained using X-ray crystallography. The data was deposited as a *.pdb* file in the [Protein Data Bank](https://www.wwpdb.org/) and its freely accessible on the Internet.

The *.pdb* file contains a monomer of the KcsA protein and everything else solved from the crystal structure. The tetramer was built and embedded in the POPC membrane following the steps on the [Membrane Proteine Tutorial](http://www.ks.uiuc.edu/Training/Tutorials/science/membrane/mem-tutorial.pdf), using the [VMD](https://www.ks.uiuc.edu/Research/vmd/) software.

The simulations for minimization, equilibration and production runs of the membrane-protein system were performed using [NAMD](https://aip.scitation.org/doi/full/10.1063/5.0014475?casa_token=HoAbwuSFSWcAAAAA%3AuO8T7NtOC1GenU3HHjq5DsDEGAd9T0LZotOjvlj1aNAHTcPOVI5GR3Rojoia-xoQKxEr0ZcMg7K0Uw), a parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems.

The file with the pressure values during the simulation was obtained using the [NAMD plot plugin](https://www.ks.uiuc.edu/Research/vmd/plugins/namdplot/) for VMD.

## Data
* The Protein Database file for KcsA is available [here](https://www.rcsb.org/)
* The output files of the simulation are public and available in the *Required tutorial files* for the [Membrane Proteins Tutorial (Advanced)](http://www.ks.uiuc.edu/Training/Tutorials/).

## Requirements
### Libraries
The following packages are necessary to run the scripts:\

* reshape2
* tidyverse
* zoo
* ggplot2
* bio3d

### Files

It is necessary to download the tutorial files to obtain the trajectory (.dcd) file if you do not have the necessary software to run build the tetramer and run the simulations. 510MB of storage are needed.

In the [Tutorials](http://www.ks.uiuc.edu/Training/Tutorials/) website, search the *Membrane Protein Tutorial (Advanced)* entry and click on *Required tutorial files: reduced version [.tar.gz, 10.2M]*. Extract the 03-MINEQ/example-output/kcsa_popcwieq-04.dcd file and save it in the data/raw file in this repository.


## Project structure

```
Project/
*    ├── data/
     │   ├── raw
        │   ├── pressure.dat
        │   ├── kcsa_popcwi.pdb
     │   └── processed
            │   ├── pressure_trace.cvs
*    ├── docs/
*    ├── output/
        ├── figs/
*    ├── R/
     │   ├── 01_package_installation.R
     │   ├── 02_data_manipulation.R
     │   ├── 03_rmsd.R
     │   ├── 04_rmsf.R
     │   ├── 05_pressure_trace.R
*    └── README.md
```
* In the `data/raw` directory you will find the .pdb file for the KcsA and the pressure values measured during the simulation.

* In the `R` directory you will find all the necessary scripts to run the project:
  * `01_package_installation.R` install the necessary packages.
  * `02_data_manipulation.R` clean the data for the pressure stability analysis.
  * `03_rmsd.R` calculate and plot the Root Mean Square Deviations during the simulation.
  * `04_rmsf.R`  calculate and plot the Root Mean Square Fluctuations during the simulation.
  * `05_pressure_trace.R` Calculate and plot the pressure and its moving average during the simulation.

* In the `data/processed` you will find the pressure.dat file processed in the script `02_data_manipulation.R`

* In the `docs` directory you will find a pdf version of report of the project, and a .tex version with its respective bibliography (.bib) file.

* In the `output/figs` directory you will find the output plots from each script.
