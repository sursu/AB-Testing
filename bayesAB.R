library(bayesAB)

#A_binom <- rbinom(100, 1, .5)
#B_binom <- rbinom(100, 1, .6)

A_binom <- rbinom(250, 1, .25)
B_binom <- rbinom(250, 1, .2)

plotBeta(100, 200) # looks a bit off

AB1 <- bayesTest(A_binom, B_binom, priors = c('alpha' = 65, 'beta' = 200), n_samples = 1e5, distribution = 'bernoulli')
AB1 <- bayesTest(A_binom, B_binom, priors = c('alpha' = 1, 'beta' = 1), distribution = 'bernoulli')
print(AB1)
summary(AB1)
plot(AB1)

x = (A_binom-B_binom)/B_binom


library(pairwiseCI)
success <- c(50, 70)
failure <- c(950, 930)
page <- c(2,1)
dataframe <- data.frame(cbind(success,failure,page))

pairwiseCI(cbind(success,failure)~page, data=dataframe, method="Prop.diff", CImethod="CC")[[1]]
pairwiseCI(cbind(success,failure)~page, data=dataframe, method="Prop.diff")
