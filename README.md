# Extended Replication of "Stay‐at‐home policy is a case of exception fallacy: an internet‐based ecological study" (2021)

Code and data investigating the claim by Savaris et al. that a reduction in mobility is not associated with a reduced COVID-19 mortality for most countries.

In March 2021, R. F. Savaris, G. Pumi, J. Dalzochio, and R. Kunst published a paper titled *["Stay‐at‐home policy is a case of exception fallacy: an internet‐based ecological study"](https://www.nature.com/articles/s41598-021-84092-1)* in Nature Scientific Reports.

They conclude that *"using this methodology and current data, in ~ 98% of the comparisons using 87 different regions of the world we found no evidence that the number of deaths/million is reduced by staying at home."*

The notebook ``savaris_covid_annotated.ipynb`` is adapted from the original [Jupyter notebook by Savaris et al.](https://gist.github.com/rsavaris66/eccfc6caf4c9578d676c134fac74d3fe)
Using this notebook and the accompanying datasets, we show that the algorithm by Savaris et al. does not find an effect of lockdowns on mortality even in artificial datasets that strongly suggest an effect of lockdowns.
In fact, the algorithm finds a stronger effect of lockdowns in random data.
This suggests that the main reason why Savaris et al. could not find an effect is that their algorithm is generally incapable of finding such effects even if they exist.

Files:

* ``savaris-2021/`` - the original data and scripts provided by Savaris et al. online
- ``savaris_covid_annotated.ipynb`` - the Jupyter notebook used by Savaris et al. with several annotations and minor changes (listed in notebook)
* ``datasets/`` - the dataset used by Savaris et al. and multiple datasets that were specifically crafted to show an effect of lockdowns or no effect.
* ``generate countries.ipynb`` - the Jupyter notebook used to generate the artificial datasets
* ``images`` - visualizations of all datasets

