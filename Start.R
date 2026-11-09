library(lidR)

## Read catalog
ctg <- readLAScatalog("Velence/")
plot(ctg)

## Select test area
roi <- clip_circle(ctg, x = 620000, y = 209000, radius = 40)
plot(roi, bg = "white", size = 2)


