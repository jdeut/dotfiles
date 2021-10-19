library(devtools)
library(magrittr)
library(stringr)

.First <- function() {
    # .libPaths = .libPaths( c("/home/johannes/Bildung/Sandbox/Rprojects/", .libPaths()) )
}

if(interactive()){
    if(Sys.getenv("NVIMR_TMPDIR") != ""){
        options(nvimcom.verbose = 1)
        library(nvimcom)
    }
    options(width = 100)
}

options(
    # defaultPackages = c(getOption("defaultPackages"), "nvimcom"),
    defaultPackages = c(getOption("defaultPackages")),
    tikzMetricsDictionary = '/home/johannes/.cache/tikzMetricsDictionary',
    usethis.full_name = "Johannes Deutsch",
    usethis.protocol  = "ssh",
    usethis.description = list(
        "Authors@R" = utils::person(
            "Johannes", "Deutsch",
            email = "johannes.deutsch@uni-due.de",
            role = c("aut", "cre")
        ),
        Version = "0.0.0.9000"
    ),
    usethis.destdir = "~/Bildung/Sandbox/Rprojects/",
    testthat.default_check_reporter = "tap"
)
