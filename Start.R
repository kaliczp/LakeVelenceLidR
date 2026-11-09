library(sf)

## Read trajectory
traj <- read.table("Velence_261015_f1_trajectory.txt", head = TRUE)
traj.sf <- st_as_sf(
    traj[,c("Time", "X", "Y", "Z")],
    coords = c("X", "Y"),
    crs = 4237
)

library(lidR)
## Read catalog
ctg <- readLAScatalog("Velence/")
plot(ctg)
lines(traj$X, traj$Y)

## Select test area
roi <- clip_circle(ctg, x = 620000, y = 209000, radius = 40)
plot(roi, bg = "white", size = 2)

## Bounding box for trajectory
trajboundaries <- sf::st_bbox(c(xmin = 620000-50, ymin = 209000-50,
                        xmax = 620000+50, ymax = 209000+50), 
                      crs = sf::st_crs(traj.sf))
# Cut trajectory for small part
traj.crop <- sf::st_crop(traj.sf, trajboundaries)

offsets <- plot(roi, color = "RGB", bg = "white", size = 2)
add_flightlines3d(offsets, traj.crop, "Z")


