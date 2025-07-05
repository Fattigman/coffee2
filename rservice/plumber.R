# plumber.R
library(plumber)

pr <- plumber$new()

pr$handle("post", "/calculate", function(req, res){
  x <- as.numeric(req$body$x)
  y <- as.numeric(req$body$y)
  res$body <- list(result = x + y)
  res
})

# Add CORS
pr$registerHooks(
  list(
    preroute = function(req, res) {
      res$setHeader("Access-Control-Allow-Origin", "*")
      res$setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
      res$setHeader("Access-Control-Allow-Headers", "Content-Type")
    }
  )
)

pr
