servr:::knit_maybe(input  = c(".", "_source", "_posts"),
                   output = c(".", "_posts", "_posts"),
                   script = c("build.R", "Makefile"),
                   method = "jekyll")
