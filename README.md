# Clusterin'Clusters

Welcome to use `Clusterin'Clusters` -code!

> This is still under construction!

We assume you have just created a plethora of .xyz- and .log-files and your face looks like

Or actually we assume that you have created a sh*tload of XTB-data and still your face looks like:
```
  L...L  
 < o o >
  \   /
  (^_^)
  ```

> Don't worry, we have kind of solved the problem for you.

## The purpose of this code package is

*Reduce the amount of molecules for the next level of theory computations*

### First

Choose your weapon with the help of this diagram:  

| *Features*          | **Jupyter**     | **Script-collection**   |
| :------------------ | :-------------- | :-------------- |
| Looks               | Nice            | Boring          |
| Printed information | Plots           | some info text  |
| Nerd-index          | Big             | Low             |
| Requirements | [Jupyter](https://anaconda.org) | [Python 3.7](https://www.python.org) |
| Recommended for     | Scientists  | Chemists    |


*Both make use of `CollectAndSortFiles.sh` and `DataExtractor.sh` which are Bash-scripts that organize the data into the form that can be then analyzed by the script*  

>WARNING: with MacOS you have to modify the `sed`-syntax inside the bash-scripts.


### Second

Make a folder for your project and download your weapon of choice into that folder.

##### Jupyter Notebook

Files:  
`JupyterNotebook`-folder

##### The Script collection

Files:  
`Scripts`-folder

### Third

Run `CollectAndSortFiles.sh`  
*Usage:* `./CollectAndSortFiles.sh <Name of the directory which the data will be put to> <Absolute path to directory containing XTB_>`

Run `DataExtractor.sh`  
*Usage:* `./DataExtractor.sh <Name of the directory where the data was put into>`


> If you're using just the python script:

Run the Python script
*Usage:* `python clusterin.py <Name of the directory where the data was put into>`

> If you're using the Jupyter Notebook

Open the JupyterNotebook and run it. Please read the text in between.


```
            _( }
   -=  _  <<  \
      `.\__/`/\\
 -=     '--'\\  `
      -=    //
            \)
```
