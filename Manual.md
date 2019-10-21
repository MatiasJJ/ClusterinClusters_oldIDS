# Clusterin'Clusters

![Clusters](Archive/Images/BackgroundMol_crop.png)

>Vitus Besel, Matias Jääskeläinen, Ilaria Pia
University of Helsinki

This program is made for handling the data produced by [ABCluster](http://www.zhjun-sci.com/software-abcluster-download.php) and [GNF-*x*TB](https://pubs.acs.org/doi/10.1021/acs.jctc.8b01176).
For instructions on usage of this program please read README.md. This manual contains information on the theoretical background of the methods used.

The program package constist of bash scripts that collect the relevant data from raw ABC+XTB data and the [Python](https://www.python.org) code that does the data analysis and machine learning methods.


#### ABCluster and GNF-*x*TB  

Our code comes into action after following programs have provided the set-up for the Configurational Sampling: ABCluster utilizes the artificial bee colony algorithm ([2](http://www.zhjun-sci.com/software-abcluster-download.php)) a generic algorithm which takes the structures of single gaseous molecules given by the user and combines them to molecular clusters and optimizes these structures on a [Molecular Mechanics](https://en.wikipedia.org/wiki/Molecular_mechanics) level of theory. It does this in a way which samples the whole [Configurational Space](https://en.wikipedia.org/wiki/Configuration_space_(physics)) and produces an amount of local minima defined by the user (typically 2000 - 100 000). Further the semi-empirical method GNF-*x*TB is used to once again optimize these structures on a better level of theory. We assume that these steps are conducted by the user within the [Jammy Key for Configurational Sampling (JKCS)](https://pubs.acs.org/doi/10.1021/acs.jpca.9b03853))

## Data Cleaning

After ABCluster and GNF-*x*TB within JKCS the user is left with thousands of output (.log) files and structure (.xyz) files in a certain directory structure. **Clusterin' Clusters** contains two bash-script, which deal with this data.

`CollectAndSortFiles.sh` creates a directory with a user specified name and resolves the directory structure from XTB by copying the .log files and .xyz files enumerated into respective directories.
*Usage:* `./CollectAndSortFiles.sh <Name of the directory which the data will be put into> <Absolute path to directory containing XTB_>`

`DataExtractor.sh` produces the **Data_Collection.csv** file, which contains the file number, energies and dipoles from the `.log` files and the paths to the `.log` and `.xyz` files.
 *Usage:* `./DataExtractor.sh <Name of the directory where the data was put into>`

 Both of these script are set-up to be called from the *Scripts* directory and will work in the specified directory located on level higher than *Scripts*


## Statistical methods

### Principal Components Analysis
The Principal components analysis (PCA) is a tool used to reduce the dimensionality of the data that tries to preserve as much information as possible.    

These two goals in PCA are pursued by means of a transformation of the original variables into new variables, called Principal Components (PCs) that consists of a linear combination of the original variables.
PCs are uncorrelated and arranged in order of decreasing variance, so that the first PCs account for most of the variation in the sample.     

Assuming we want to reduce the number of our original p variables to k<p variables, , denoted Σ the covariance matrix of the variables' matrix X, the PCA method can be formalized as follows:  

   •  1st PC: determine the coefficients of the linear combination      ![equation](https://latex.codecogs.com/gif.latex?Z_%7B1j%7D%3Da_1%5ETX%3D%5Csum_%7Bi%3D0%7D%5Epa_%7B1i%7DX_i)
    that maximize ![equation](https://latex.codecogs.com/gif.latex?Var%28Z_1%29%3Da_1%5ET%5CSigma%20a_1) under the constraint ![equation](https://latex.codecogs.com/gif.latex?a_1%5ETa_1%3D1)  
   •  2nd PC: determine coefficients of the linear combination
        ![equation](https://latex.codecogs.com/gif.latex?Z_%7B2j%7D%20%3D%20a_2%5ET%20X%20%3D%20%5Csum_%7Bi%3D0%7D%5Ep%20a_%7B2i%7D%20X_i)
        that maximize ![equation](https://latex.codecogs.com/gif.latex?Var%28Z_2%29%20%3D%20a_2%5ET%20%5CSigma%20a_2)  under the constraint ![equation](https://latex.codecogs.com/gif.latex?a_2%5ET%20a_2%3D1) and ![equation](https://latex.codecogs.com/gif.latex?Cov%28Z_1%2CZ_2%29%3D0)   

   •  proceed in a similar fashion for all other components...   

The final output is a set of p uncorrelated variables with decreasing variance: ![equation](https://latex.codecogs.com/gif.latex?Z_1%2C...%20%2CZ_p) such that ![equation](https://latex.codecogs.com/gif.latex?Var%28Z_1%29%20%3E%20Var%28Z_2%29%20%3E...%20%3E%20Var%28Z_p%29) and ![equation](https://latex.codecogs.com/gif.latex?Cov%28Z_j%20%2C%20Z_k%20%29%20%3D%200) for j ≠ k.


We apply PCA to our coordinates variables, and select new variables, that explain at least 80% of the variability of our data. The variables Dipole and Energy are kept unchanged so that we won't lose their intrinsic meaning.

### Clustering with k-Means
In order to reduce the variety of the observations we cluster the data, by using a k-mean algorithm, that is a non-hierarchical method of clustering, i.e. the number k of groups is assumed to be fixed.
The algorithm, introduced by MacQueen in 1967, consists of assigning each datapoint to the cluster whose centroid (i.e. vector of means) is the closest one.  The metric used to measure the distance among groups is typically the Euclidean one. \newline
It can be represented as follow:

   1. Initial partition into K clusters, (possibly randomly generated)
   2. For each of the K clusters, compute the cluster centroid.
   3. Assign each observation to the cluster whose centroid is closest
   4. Recompute centroids for all clusters
   5. Repeat 3. - 4. until reaching a maximum number of iterations or when it is not possible to redistribute observations


As stated above a crucial parameter is the number of groups k. If such parameter is not clearly recoverable from the data itself, a good criteria to chose the optimal one,  is to find a balance between low within-cluster variation and number of groups. A common method is to select the number of clusters k that maximize the Calinksi-Harabasz (CH) index:

![equation](https://latex.codecogs.com/gif.latex?CH%28k%29%3D%5Cfrac%7BB%28k%29%7D%7BW%28k%29%7D%5Cfrac%7Bn-k%7D%7Bk-1%7D)  

where n is the number of data points, k the number of clusters, W(k) the within cluster variation and B(k) the between cluster variation.

As the resulting clusters depend strongly on the choice of the starting centroids a common practice is to repeat the algorithm several times with different starting centroids, randomly generated.


We applied the k-mean algorithm to our data, selecting a number of clusters k=23 as this is the number of possible permutations of our chemical cluster: there are 23 different ways of adding 4 water molecules, 1 ammonia and 1 sulfuric acid. The possibility to select k according to the CH index is also given.

### Visualization with t-SNE
To visualize the multidimensional dataset we use the t-Distributed Stochastic Neighbor Embedding (t-SNE), an unsupervised, non-linear technique of dimensionality reduction, introduced by Laurens van der Maatens and Geoffrey Hinton in 2008.   
The t-SNE aims to preserve the similarity between the original d-dimensional points and the 2-dimensional points returned as an output. As a measure of similarity we take conditional probability under specific kernels.
The algorithm can be divided in three steps.  

First we convert the high-dimensional Euclidean distances between d-dimensional datapoints ![equation](https://latex.codecogs.com/gif.latex?%28x_i%29_%7Bi%3D1%5Cdots%20n%7D) into conditional probabilities ![equation](https://latex.codecogs.com/gif.latex?p_%7Bi%7Cj%7D) that represent the probability that ![equation](https://latex.codecogs.com/gif.latex?x_i) would pick ![equation](https://latex.codecogs.com/gif.latex?x_j) as its neighbor if neighbors were picked in proportion to their probability density under a Gaussian centered at ![equation](https://latex.codecogs.com/gif.latex?x_i).

In the same way, we convert the Euclidean distances between 2-dimensional points ![equation](https://latex.codecogs.com/gif.latex?%28y_i%29_%7Bi%3D1%5Cdots%20n%7D) into conditional probabilities ![equation](https://latex.codecogs.com/gif.latex?q_%7Bi%7Cj%7D) that give the probability that ![equation](https://latex.codecogs.com/gif.latex?y_i) would pick ![equation](https://latex.codecogs.com/gif.latex?y_j) as its neighbor if neighbors were picked in proportion to their probability density under a Chaucy distribution centered at ![equation](https://latex.codecogs.com/gif.latex?y_i).

Finally, to measure the difference between the probability distributions of the d-dimensional and the 2-dimensional points we use the Kullback-Liebler divergence (KL) :   

![equation](https://latex.codecogs.com/gif.latex?KL%28P%7C%7CQ%29%20%3D%20%5Csum_%7Bi%20%5Cneq%20j%7D%20p_%7Bij%7D%20%5Clog%28%5Cfrac%7Bp_%7Bij%7D%7D%7Bq_%7Bij%7D%7D%29)   

T-SNE minimizes the sum of Kullback-Leibler divergences over all datapoints using a gradient descent method.   

A plot of the clustered datapoints in the 2-dimensional t-SNE space is given as a final output.
