# Clusterin'Clusters

Welcome to use `Clusterin'Clusters` -code!

We assume you have just created a sh*tload of XTB-data and still your face looks like:
```
  L...L  
 < o o >
  \   /
  (^_^)
  ```

> Don't worry, we have kind of solved the problem for you.

## The purpose of this code package is

*Reduce the amount of molecules for the next level of theory computations and give some preliminary overview over the data.*

## How to..?
### First

Choose your weapon with the help of this diagram:  

| *Features*          | **Jupyter**     | **Script-collection**   |
| :------------------ | :-------------- | :-------------- |
| Looks               | Nice            | Boring          |
| Printed information | Plots           | some info text  |
| Nerd-index          | Big             | Low             |
| Requirements | [Jupyter](https://anaconda.org) | [Python 3.7](https://www.python.org) |
| Recommended for     | Scientists  | Chemists    |

>WARNING: with MacOS you have to modify the `sed`-syntax inside the bash-scripts.

### Second

1. Make a folder for your project (hereby: ProjectFolder)
2. Download your weapon of choice into ProjectFolder  

**For pure testing purposes we have provided you with sample XTB-data. Please download XTB-folder into ProjectFolder**

##### Jupyter Notebook

Files:  
`JupyterNotebook`-folder

##### The Script collection

Files:  
`Scripts`-folder

### Third

Open command prompt and navigate to `ProjectFolder/weapon-of-choice/`
Run `CollectAndSortFiles.sh`
*Usage:* `./CollectAndSortFiles.sh <Name of the directory which the data will be put to> <Absolute path to directory containing XTB_>`

Run `DataExtractor.sh`  
*Usage:* `./DataExtractor.sh <Name of the directory where the data was put into>`

> If you're using the python script:

Run the Python script
*Usage:* `python ClusterinClusters.py $(pwd) <Name of the directory where the data was put into> <the number that `CollectAndSortFiles.sh` prints>`

> If you're using the Jupyter Notebook

Open the JupyterNotebook and run it. Please read the text in between.

After you're finished, your face should look like:
![smile](Archive/Images/Egg.png)
