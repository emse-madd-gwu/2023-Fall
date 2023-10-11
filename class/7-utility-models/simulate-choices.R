# Make conjoint surveys using the cbcTools package

# Install packages
# install.packages("fastDummies")
# install.packages("remotes")
# remotes::install_github("jhelvy/cbcTools")

# Load libraries
library(cbcTools)
library(fastDummies)
library(logitr)

# Define profiles with attributes and levels
profiles <- cbc_profiles(
    price       = c(15, 20, 25), # Price ($1,000)
    fuelEconomy = c(20, 25, 30),   # Fuel economy (mpg)
    accelTime   = c(6, 7, 8),      # 0-60 mph acceleration time (s)
    powertrain  = c("Gasoline", "Electric")
)

# Make a full-factorial design of experiment
design <- cbc_design(
    profiles = profiles,
    n_resp   = 1000, # Number of respondents
    n_alts   = 3,    # Number of alternatives per question
    n_q      = 8     # Number of questions per respondent
)

# --------------------
# Simulate choice data!
# --------------------

# Dummy code the powertrain attribute
design <- dummy_cols(design, "powertrain")
head(design)

# Simulate random choices
data <- cbc_choices(
    design = design,
    obsID = "obsID"
)

# Simulate choices according to an assumed utility model
data <- cbc_choices(
    design = design,
    obsID = "obsID",
    priors = list(
        price       = -0.7,
        fuelEconomy = 0.1,
        accelTime   = -0.2,
        powertrain_Electric = -4.0
    )
)

# Estimate a model 
model <- logitr(
  data   = data,
  outcome = "choice",
  obsID  = "obsID",
  pars   = c("price", "fuelEconomy", "accelTime", "powertrain_Electric")
)

summary(model)
