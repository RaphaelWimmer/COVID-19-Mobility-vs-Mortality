setwd("~/Desktop/code_COVID_xlsx/conferencia.xlsx")
library("bstats")
library(lmtest)
library(readxl)

conferencia <- read_excel("conferencia.xlsx")
pares<- read_excel("pares_conf.xlsx")


i=1
A=as.character(pares[i,1])
B=as.character(pares[i,2])
xyA=as.matrix(conferencia[conferencia$location==A,2:3])
xyB=conferencia[conferencia$location==B,2:3]
deaths = (xyA - xyB)[,1]  
iso   = (xyA - xyB)[,2]
model = lm(deaths~iso)
ds = summary(model)



coefs = model$coefficients
pv=coef(ds)[,4]
# Residual analysis
resd = model$residuals
tests = c(shapiro.test(resd)$p.value, # H0: normality
          white.test(model)$p.value, # H0:  homoskedasticity
          bgtest(model)$p.value, # H0: uncorrelated errors
          resettest(model)$p.value) # Model is functionally well specified
coint = as.numeric(PP.test(lm(deaths~iso)$residuals)[3])

fr=data.frame("A" = A, "B" = B, "intercept" = as.numeric(coefs[1]), "coef_isol" = as.numeric(coefs[2]), 
              "p.value_iso" = pv[2], "Shapiro" = shapiro.test(resd)$p.value,
              "White" = white.test(model)$p.value, "LM-test" = bgtest(model)$p.value,
              "Reset" = resettest(model)$p.value, "Coint" = coint)

for(i in 2:dim(pares)[1]){
  A=as.character(pares[i,1])
  B=as.character(pares[i,2])
  xyA=as.matrix(conferencia[conferencia$location==A,2:3])
  xyB=conferencia[conferencia$location==B,2:3]
  deaths = (xyA - xyB)[,1]  
  iso   = (xyA - xyB)[,2]
  model = lm(deaths~iso)
  ds = summary(model)
  coefs = model$coefficients
  pv=coef(ds)[,4]
  # Residual analysis
  resd = model$residuals
  coint = as.numeric(PP.test(lm(deaths~iso)$residuals)[3])
  
  fr=rbind(fr,data.frame("A" = A, "B" = B, "intercept" = as.numeric(coefs[1]), "coef_isol" = as.numeric(coefs[2]), 
                         "p.value_iso" = pv[2], "Shapiro" = shapiro.test(resd)$p.value,
                         "White" = white.test(model)$p.value,  "LM-test" = bgtest(model)$p.value,
                         "Reset" = resettest(model)$p.value, "Coint" = coint))
}


write.table(fr, file = "Todos_conf.csv", sep = ",", row.names = F)
