local({
  # fall back on '/' if baseurl is not specified
  baseurl = servr:::jekyll_config('.', 'baseurlknitr', '/')
  knitr::opts_knit$set(base.url = baseurl)

  # ```-block syntax highlighting  is working fine for gh-pages
  # with this .Rmd > md converter:
  knitr::render_markdown()
  
  # input/output filenames are passed as two additional arguments to Rscript
  a = commandArgs(TRUE)
  d = gsub('^_|[.][a-zA-Z]+$', '', a[1])
  knitr::opts_chunk$set(
    fig.path   = sprintf('img/%s/', d),
    cache.path = sprintf('cache/%s/', d)
  )
  
  if (Sys.getenv('USERNAME') == 'David' && Sys.getenv('USERDOMAIN') == 'SELBYPC') {
    # On windows this ^ is 'USERNAME' but on Mac/Linux maybe 'USER'
    knitr::opts_chunk$set(fig.path = sprintf('img/%s/', gsub('^.+/', '', d))) # 'img/%s/'
    knitr::opts_knit$set(
      base.dir = '~/GitHub/blogr/'#,  # where to save generated plots
      #base.url = '~/GitHub/blogr/'   # where .md posts will look for them, if different
    )
  }
  knitr::opts_knit$set(width = 70)
  knitr::knit(a[1], a[2], quiet = TRUE, encoding = 'UTF-8', envir = .GlobalEnv)
})

# NB: delete .md files first if you want their images re-generated