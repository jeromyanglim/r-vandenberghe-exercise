# Data manipulations
# Highlight and run command below do load project without munging.
# This is useful when debugging data manipulation code.
# library(ProjectTemplate); load.project(list(munging=FALSE)) 

# It is often useful to create sets of variable names
# By convention, the list that stores these variable sets is called 'v'
v <- list()
v$mlq_items <- meta.mlq$id  
v$mlq_scales <- unique(meta.mlq$scale)
v$mlq_transactional <- c("mbep", "mbea", "cr")
v$mlq_transformational <- c("ac", "is", "ic")
v$outcome <- "goal"


rmlq <- mlq
# we could exclude missing data
mlq$missing_count <- apply(mlq[,c(v$mlq_scales, v$outcome)], 1, function(X) sum(is.na(X)))

mlq <- mlq[mlq$missing_count == 0, ]
