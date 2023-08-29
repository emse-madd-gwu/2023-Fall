# Create values
area_sf <- 47
area_chicago <- 228
area_dc <- 61
pop_sf <- 884
pop_chicago <- 2716
pop_dc <- 694

# Compute densities
dens_sf <- pop_sf / area_sf
dens_chicago <- pop_chicago / area_chicago
dens_dc <- pop_dc / area_dc
dens_sf
dens_chicago
dens_dc

# Compute addition DC population to match SF density
(dens_sf*area_dc) - pop_dc