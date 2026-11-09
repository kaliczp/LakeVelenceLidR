library(lidR)

## Read trajectory
traj <- read.table("Velence_261015_f1_trajectory.txt", head = TRUE)

## Read catalog
ctg <- readLAScatalog("Velence/")
plot(ctg)
lines(traj$X, traj$Y)

## Select test area
roi <- clip_circle(ctg, x = 620000, y = 209000, radius = 40)
plot(roi, bg = "white", size = 2)


