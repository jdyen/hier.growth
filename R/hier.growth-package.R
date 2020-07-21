#' The 'hier.growth' package: Fit and validate common growth curve models
#'
#' @description growmodr allows you to fit growth models to size-at-age data
#'   and to  validate these models with cross validation or common model
#'   comparison tools (r2, WAIC, loo).
#'
#' @docType package
#' @name hier.growth-package
#' @aliases hier.growth
#' @useDynLib hier.growth, .registration = TRUE
#' @import methods
#' @import stats
#' @import Rcpp
#' @importFrom rstan optimizing sampling vb extract summary get_posterior_mean
#' @importFrom loo extract_log_lik loo waic
#' @importFrom splines splineDesign
#' @importFrom splines2 iSpline
#'
#' @details The main function you'll use in \pkg{growmodr} is \code{\link{growmod}}
#'   and its associated methods, particularly the \code{\link{validate}} method.
#'   See the package vignettes and help files for examples of fitting growth
#'   curves to data.
#'
#' @examples
#' \dontrun{
#'   # simulate some data
#'   data_sim <- growmod_sim(n = 100,
#'                           nblock = 5,
#'                           age_range = c(0, 50),
#'                           include_predictors = TRUE,
#'                           true_model = 'hillslope')
#'
#'   # fit the correct model
#'   mod1 <- growmod(size ~ (index | block / predictors),
#'                   data = data_sim,
#'                   model = 'hillslope',
#'                   n_iter = 1000,
#'                   n_burnin = 500,
#'                   n_chains = 2,
#'                   stan_cores = 1)
#'
#'   # plot the fitted model
#'   plot(mod1)
#'
#'   # summarise the fitted model
#'   summary(mod1)
#'
#'   # print the fitted model
#'   print(mod1)
#'
#'   # cross validate the fitted model
#'   mod1_cv <- validate(mod1)
#'
#'   # fit an incorrect model
#'   mod2 <- growmod(size ~ (index | block / predictors),
#'                   data = data_sim,
#'                   model = 'koblog',
#'                   n_iter = 1000,
#'                   n_burnin = 500,
#'                   n_chains = 2,
#'                   stan_cores = 1)
#'
#'   # compare the fitted models using summary measures of fit
#'   compare(mod1, mod2)
#'
#'   # compare the fitted models using cross validation
#'   mod2_cv <- validate(mod2)
#'   compare(mod1_cv, mod2_cv)
#'
#'   # example of multiple models fitted in one call
#'   mod_multi <- growmod(size ~ (index | block / predictors),
#'                        data = data_sim,
#'                        model = c('hillslope',
#'                                  'koblog'),
#'                        n_iter = 1000,
#'                        n_burnin = 500,
#'                        n_chains = 2,
#'                        stan_cores = 1)
#'
#' }
#'
#' @references
#' Stan Development Team (2020). RStan: the R interface to Stan. R package version 2.19.3. https://mc-stan.org
#'
#' Thomas, F.M., Yen, J.D.L. and Vesk, P.A. (2019) Using functional traits to predict species growth trajectories,
#'   and cross validation to evaluate these models for ecological prediction. Ecology and Evolution, 9: 1554-1566.
#'
NULL
