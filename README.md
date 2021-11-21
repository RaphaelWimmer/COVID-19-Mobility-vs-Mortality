# Investigation on the Robustness of the Method used in "Stay‐at‐home policy is a case of exception fallacy: an internet‐based ecological study" (2021)

Code and data investigating the claim by Savaris et al. that a reduction in mobility is not associated with a reduced COVID-19 mortality for most countries.

In March 2021, R. F. Savaris, G. Pumi, J. Dalzochio, and R. Kunst published a paper titled *["Stay‐at‐home policy is a case of exception fallacy: an internet‐based ecological study"](https://www.nature.com/articles/s41598-021-84092-1)* in Nature Scientific Reports.

They conclude that *"using this methodology and current data, in ~ 98% of the comparisons using 87 different regions of the world we found no evidence that the number of deaths/million is reduced by staying at home."*

The notebook ``savaris_covid_annotated.ipynb`` is adapted from the original [Jupyter notebook by Savaris et al.](https://gist.github.com/rsavaris66/eccfc6caf4c9578d676c134fac74d3fe)
Using this notebook and the accompanying datasets, we show that the algorithm by Savaris et al. does not find an effect of lockdowns on mortality even in artificial datasets that strongly suggest an effect of lockdowns.

![Figure 1: A set of hypothetical countries for which there is an obvious effect of mobility on mortality.](images/Figure_1_Hypothetical_Countries.png?raw=true)

![Figure 2: A heatmap of comparisons of the hypothetical countries using Savaris' method. None of the comparisons shows an effect according to the](images/Figure_2_Heatmap_Hypothetical_Countries.png?raw=true)

In fact, the algorithm finds a stronger effect of lockdowns in random data than in the optimized datasets.

![Figure 6: A heatmap of comparisons of countries with random mobility/mortality data. Comparisons with p < .05 indicate an effect of lockdowns.](images/Figure_6_Heatmap_Random_Countries.png?raw=true)

While an artificial example dataset shared by R.F. Savaris seems to demonstrate that their method works, adding a little bit of noise to the data makes the effect disappear again.

![Figure 7: Adding noise to Savaris "proof-of-concept" dataset destroys the claimed effect](images/Figure_7_Savaris_Custom_Dataset.png?raw=true)

In summary, these findings suggest that the main reason why Savaris et al. could not find an effect of lockdowns on mortality is that their algorithm is generally incapable of finding such effects even if they exist.

These code and datasets are supplementary materials to a *Matters Arising* letter to Nature Scientific Reports.

Contact: Raphael Wimmer <raphael.wimmer@ur.de>

Files:

* ``savaris-2021/`` - the original data and scripts provided by Savaris et al. online
- ``savaris_covid_annotated.ipynb`` - the Jupyter notebook used by Savaris et al. with several annotations and minor changes (listed in notebook)
* ``datasets/`` - the dataset used by Savaris et al. and multiple datasets that were specifically crafted to show an effect of lockdowns or no effect.
* ``generate countries.ipynb`` - the Jupyter notebook used to generate the artificial datasets
* ``images`` - visualizations of all datasets

