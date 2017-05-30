servr:::knit_maybe(input = c('.', '_source', '_posts'),
                   output = c('.', '_posts'),
                   script = c('Makefile', 'build.R'),
                   method = 'jekyll')
