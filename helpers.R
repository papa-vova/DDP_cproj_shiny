library(UsingR)
data(galton)

g_lm <- lm(child ~ parent, data=galton)

# axes ranges
# ymin = floor(min(galton$child))
# ymax = ceil(max(galton$child))
# xmin = floor(min(galton$parent))
# xmax = ceil(max(galton$parent))
ymin = 60
ymax = 75
xmin = 60
xmax = 75


# intercept and ranges
g_ic = round(g_lm$coef[1], 2)
g_ic_min = floor(g_ic)-10
g_ic_max = ceil(g_ic)+10

# slope
g_slope = round(g_lm$coef[2], 3)