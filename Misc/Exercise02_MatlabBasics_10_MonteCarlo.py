#%%
from matplotlib import pyplot as plt
import numpy as np
import seaborn as sns
import pandas as pd

#%%
# Selected number of points
N = 5000

# Create random points in range [-1,1]
A = -1 + (1-(-1))*np.random.rand(N,2)

# Take note of the indexing in Python
# To accsess the first column, index 0 must be called
# Convert numpy array into pandas Dataframe
pointCoord = pd.DataFrame(A)
pointCoord.rename(columns = {0: "x",
                           1: "y"},
                           inplace = True)
pointCoord.head()

#%%
# Create Pandas Series
xCoord = pointCoord['x']
yCoord = pointCoord['y']

#%%
# Create extra column in DataFrame to check if the point lies in the circle
ViC = []
for k in range(0,N):
    if xCoord[k]**2 + yCoord[k]**2 < 1:
        ViC.append("Yes")
    else:
        ViC.append("No")
ViC_Series = pd.DataFrame(ViC)
ViC_Series.rename(columns = {0: "Point in Circle"}, inplace = True)

pointCoord = pointCoord.join(ViC_Series)
pointCoord.head()

#%%
# Ni: Points within the range x^2 + y^2 < 1
# To determine pi, multiply area of square with ratio of Ni and N
Ni = 0 
for i in range(0,N):
    if xCoord[i]**2 + yCoord[i]**2 < 1:
        Ni = Ni + 1

# Draw evenly-spaced colors in a circular color space
# Most common way to do this is using the hls color space
plt.figure(figsize=(10,6))
cmap = sns.color_palette("hls",2)
sns.scatterplot(x = "x", y = "y",
                        hue = "Point in Circle", 
                        data=pointCoord, palette=cmap)
plt.legend(bbox_to_anchor=(1,1), loc=2)

#%%
valueOutput = 4 * Ni / N
print("The value of pi is {0}".format(valueOutput))