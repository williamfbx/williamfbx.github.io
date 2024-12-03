library(haven)
library(stargazer)
library(AER)

# Data read
import_data = read_dta("28143-0001-Data.dta")

# Importing parameters of interest
CITY = import_data["CITY"]
SEX = import_data["SEX"]

EDU_LEVEL = import_data["HED_C7"]
EXP = import_data["EXP"]
HHINC = import_data["HHINC"]

CADRE1 = import_data["CADRE1"]
CADRE2 = import_data["CADRE2"]
CADRE_OFFSPRING = import_data["RCADREB"]

# Dataset aggregation
interest_ds = data.frame(CITY, SEX, EDU_LEVEL, EXP, HHINC, CADRE1, CADRE2, CADRE_OFFSPRING)

# Removes entries where observations are missing
remove_index = c()

for (index_entry in 1:nrow(interest_ds)) {
  entry = interest_ds[index_entry, ]
  entry_remove = FALSE
  
  # Logical tests to find missing values
  if (entry["EXP"] < 0) { 
    entry_remove = TRUE
  }
  
  # The leq sign is to remove any values where the person was unemployed as it would
  # cause the log-linear regression to fail
  if (entry["HHINC"] <= 0) {
    entry_remove = TRUE
  }
  
  if (entry["CADRE1"] < 0) {
    entry_remove = TRUE
  }
  
  if (entry["CADRE2"] < 0) {
    entry_remove = TRUE
  }
  
  if (entry["RCADREB"] < 0) {
    entry_remove = TRUE
  }
  
  if (entry_remove == TRUE) {
    remove_index = c(remove_index, index_entry)
  }
}

# Adjusted aggregated dataset with no missing values
adj_interest_ds = interest_ds[-remove_index, ]

# OLS regression
ols_reg = lm(log(HHINC)~CITY+SEX+HED_C7+EXP+CADRE2, data=adj_interest_ds)
ols_reg_hc = coeftest(ols_reg, vcov=vcovHC)

# Table output
control_var_names = c("Intercept", "City", "Gender", "Education", "Experience",
                      "Cadre Status")

stargazer(ols_reg, title = "OLS Log Earnings (non-HC)",
          covariate.labels = control_var_names,
          dep.var.labels = "Log Monthly Household Income", 
          intercept.bottom = FALSE, intercept.top = TRUE,
          omit.stat=c("f", "ser"))

stargazer(ols_reg_hc, title = "OLS Log Earnings (HC)",
          covariate.labels = control_var_names,
          dep.var.labels = "Log Monthly Household Income", 
          intercept.bottom = FALSE, intercept.top = TRUE,
          omit.stat=c("f", "ser"))

# 2SLS regression
iv_reg = ivreg(log(HHINC)~CITY+SEX+HED_C7+EXP+CADRE2 | 
                 CITY+SEX+HED_C7+EXP+RCADREB+CADRE1, data=adj_interest_ds)
iv_reg_hc = coeftest(iv_reg, vcov=vcovHC)

# Table output
control_var_names = c("Intercept", "City", "Gender", "Education", "Experience",
                      "Cadre Status")

stargazer(iv_reg, title = "2SLS Log Earnings (non-HC)",
          covariate.labels = control_var_names,
          dep.var.labels = "Log Monthly Household Income", 
          intercept.bottom = FALSE, intercept.top = TRUE,
          omit.stat=c("f", "ser"))

stargazer(iv_reg_hc, title = "2SLS Log Earnings (HC)",
          covariate.labels = control_var_names,
          dep.var.labels = "Log Monthly Household Income", 
          intercept.bottom = FALSE, intercept.top = TRUE,
          omit.stat=c("f", "ser"))

# Check for IV relevance
rel_reg = lm(CADRE2~CITY+HED_C7+SEX+EXP+RCADREB+CADRE1, data=adj_interest_ds)
rel_test = linearHypothesis(rel_reg, c("RCADREB = 0", "CADRE1 = 0"), test="Chisq", 
                            vcov=vcovHC(rel_reg))

# Table output
control_var_names = c("Intercept", "City", "Education", "Gender", "Experience",
                      "Offspring Cadre Status", "First Cadre Status")

stargazer(rel_reg, title = "First Stage 2SLS Relevance Regression",
          covariate.labels = control_var_names,
          dep.var.labels = "Cadre Status", 
          intercept.bottom = FALSE, intercept.top = TRUE,
          omit.stat=c("f", "ser"))

W = rel_test[[3]][2]
ProbW = pchisq(W, df=2, lower.tail=FALSE)
round(cbind(W, ProbW), 4)

# Check for IV exogeneity
residuals_iv_reg = iv_reg$residuals
overid_reg = lm(residuals_iv_reg~CITY+SEX+HED_C7+EXP+RCADREB+CADRE1,
                data=adj_interest_ds)

overid_test = linearHypothesis(overid_reg, c("RCADREB = 0", "CADRE1 = 0"), test="Chisq",
                               vcov=vcovHC(overid_reg))

# Degrees of freedom adjustment
J = overid_test[[3]][2]
ProbJ = pchisq(J, df=1, lower.tail=FALSE)

# Table output
round(cbind(J, ProbJ), 4)
