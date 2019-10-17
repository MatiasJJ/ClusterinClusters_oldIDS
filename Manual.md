# Clusterin'Clusters

## Project work
### Introduction to data science

![Clusters](Archive/Images/BackgroundMol_crop.png)

>Vitus Besel, Matias Jääskeläinen, Ilaria Pia
University of Helsinki

Some kind of structure will be

- Prerequisites:  
  - ABCluster (http://www.zhjun-sci.com/software-abcluster-download.php) + XTB (https://pubs.acs.org/doi/10.1021/acs.jctc.8b01176)
- Cleaning Data:  
  - bash scripts collecting it in appropriate files  
  - Forming a nice pandas data frame  
  - Applying statistical and machine learning methods  


## Introduction

Atmospheric science has become increasingly popular especially in the face of climate change and a growing environmental awarness in society. In order to understand the highly complex processes happening in the atmosphere it is not only necessary to conduct fieldwork and measurements, it is also important to deliver the theoretical framework in order to perform simulations complementing the fieldwork or making large scale predictions. One subfield of atmospheric sciences deals with New Particle Formation, which is the formation of particles from single gaseous molecules in the atmosphere, which then can grow further into cloud condensation nuclei. As aerosol- and aerosol-cloud interactions still contribute to the highest uncertainties within current climate models [1](https://www.ipcc.ch/report/ar5/wg1/anthropogenic-and-natural-radiative-forcing/) this subfield of New Particle Formation is a especially interesting research object.

# Configurational Sampling

In order to understand how single gaseous molecules form first molecular cluster and then bigger particles, it is necessary to know the structure of these molecular clusters. However, with an increasing number of molecules inside of an atmospheric cluster, the number of possible conformers rises rapdily. More simply put there are *e.g.* for a molecular cluster made of six sulfuric acid and six ammonia molecules tens of thousands possible ways to form, differing in distances, angles or protonation states of single molecules. *Configurational Sampling* is a method to obtain the relevant local minima structures -*i.e.* the energetically most favorable ones - by a combination of computational chemistry methods and data analysis. This is needed because mainly these minima structures are present in the atmosphere and therefore relevant for atmospheric simulations.

**Clusterin' Clusters** is a data analysis tool which helps the user to deal with the huge amount of data produced in a Configurational Sampling procedure and moreover

# ABCluster and GNF-*x* TB

Our code


## What the code does?
reads data in
makes a .csv-file that contains:

Header row: ``` Filename,LogPath,XYZPath,Dipole,Energy ```


| Filename | LogPath | XYZPath | Dipole| Energy |
|------|------|------|------|------|
| Name of the cluster | path to .log-file | path to .xyz-file | Dipole moment value | Energy value |

## Outcomes

How do we present it in a website/Manual | How do we sell it?i
Prerequisites
ABCluster employs a generic algorithm -> generates molecular clusters from cluster monomers. + Optimization on MM level
XTB is a semi-empiric method
Preparing data
Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.
Collecting and sorting files
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan.
Creating a suitable data frame
Applying statistical and machine-learning methods
Nam liber tempor cum solu
Discussion
Does it work? In which ways?
Publication
How do we present it / publish it?
