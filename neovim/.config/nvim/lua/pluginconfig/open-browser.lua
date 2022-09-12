vim.g.openbrowser_browser_commands = { {
      args = {
         '{browser}', '-n', '{uri_noesc}'
      },
      name = 'luakit'
   },
   {
      args = {
         '{browser}', '-n', '{uri}'
      },
      name = 'recoll'
} }

vim.g.openbrowser_search_engines = {
   wortbuch        = 'https://www.dwds.de/?q={query}',
   loveapiref      = 'http://love2d-community.github.io/love-api/#{query}',
   tex             = 'https://www.google.com/search?q=site:tex.stackexchange.com+{query}',
   googlebooks     = 'https://www.google.de/search?hl=de&tbo=p&tbm=bks&q={query}&tbs=,bkv:p,cdr:1,cd_min:01.01.1995&num=50',
   semanticscholar = 'https://www.semanticscholar.org/search?q={query}',
   googlescholar   = 'https://scholar.google.de/scholar?hl=de&q={query}',
   google          = 'https://google.com/search?q={query}',
   github          = 'https://github.com/search?q={query}',
   github_code     = 'https://github.com/search?type=code&q={query}',
   github_wiki     = 'https://github.com/search?type=wikis&q={query}',
   linguee_eng_ger = 'https://www.linguee.com/english-german/search?source=auto&query={query}',
   googleimages    = 'https://www.google.com/search?q={query}&tbm=isch&tbs=ic:gray%2Citp:lineart%2Cisz:l&biw=1459&bih=765'
}
