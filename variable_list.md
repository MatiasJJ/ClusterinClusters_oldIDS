## PCA
> Eli vaikka plotti näyttää siltä että overläppää niin koko avaruudessa ne ei overläppää :P:P:P:P:P

Reverse PCA could be tested with feeding only one structure and see if it comes back
- if it can be done

## ClusterClusterML.ipynb
#### Variables

| Variable             | Usage                     | Data type   |
| :------------------- | :-----------------------  | :-----------|
| `project_folder`     | get the absolute path     | str         |
| `the_name`           | name of the data folder   | str         |
| `path2csv`           | to find the `.csv`-file   | str         |
| `path2out`           | to put the outputs        | str         |
| `n_perm`             | number of permutations    | int         |
| `n_atoms`            | atoms in the clusters     | int         |
| `atomnames`          | atomnames from coords     | DF          |
| `clusters_df`        | Whole data                | DF          |
| `energy`             | energies col              | Series      |
| `coord`              | coordinate data           | DF          |
| `coord_train`        | x for training            | array       |
| `coord_test`         | x for testing             | array       |
| `energy_train`       | y for training            | array       |
| `energy_test`        | y for testing             | array       |
| `model`              | Linear Reg                | ***         |
| `r_sq`               | $ R^2 $-score             | float       |
| `energy_pred`        | predicted energies        | array       |
| `predictions`        | pred comparison           | DF          |
| `pca`                | PCA analysis obejct       | pca         |
| `PCs_coord`          | PCs of coordinates        | array?      |
| `PCs_df`             | PCs of coordinates        | DF          |
| `PCsE_df`            | PCs and energies          | DF          |
| `kmeans_ED`          | K-means object E+dipole   | kmeans      |
| `ED_kmeans_res`      | K-means prediction        | array       |
| `centers_ED`         | E+dipol centers for plot  | array       |
| `kmeans_PCs`         | K-means object PCA        | kmeans      |
| `PCs_kmeans`         | K-means pred from PCs     | array       |
| `centers_PCs`        | PCs centers for plot      | array       |
| `kmeans_PCE`         | K-means object PCs+E      | kmeans      |
| `PCE_kmeans`         | K-means pred from PCs+E   | array       |
| `centers_PCE`        | E+PCA centers for plot    | array       |
| `mu`                 | mean for PCA rev          | float       |
| `pca_rev`            | avg coords from PCA rev   | array       |
| `stat_clusts_DF`     | avg coords as DF          | DF          |
| `row_arr`            | one coord in loop         | array       |
| `avg_xyz`            | `row_arr` ordered to save | DF          |
| `k_values`           | look for optimal n_clusts | array       |
| `ch_values`          | calinski-harabasz scores  | array       |
| `k_best`             | the best amount of clusts | int         |
| `kbest_PCE`          | K-means PCs+E /w k_best   | kmeans      |
| `PCE_kbest`          | pred from PCs+E (k_best)  | array       |
| `centers_kbest`      | E+PCA centers /w k_best   | array       |
| `tsne_PCE`           | t_SNE for PCs+E           | array       |
| `tsne_PCE_cluster`   | t_SNE + groupID           | array       |
| `centers_tSNE`       | E+PCA centers for t-SNE   | array       |
