node-find-rss [![Build Status](https://travis-ci.org/nikezono/node-find-rss.png)](https://travis-ci.org/nikezono/node-find-rss)
---

[![NPM](https://nodei.co/npm/find-rss.png)](https://nodei.co/npm/find-rss/)

find rss feeds in url

wrapper of [htmlparser2](https://github.com/fb55/htmlparser2)

##install

***using npm:***

    npm install find-rss

****or using package.json:***

    "find-rss": "*"

##usage
    # Coffeescript
    finder = require 'find-rss'
    finder "http://www.apple.com/",(error,candidates)->
      console.log error if error
      console.log candidates

      # =>
      # [ { sitename: 'Apple'
            rel: 'alternate',
            type: 'application/rss+xml',
            title: 'RSS',
            href: 'http://images.apple.com/main/rss/hotnews/hotnews.rss',
            favicon: 'http://www.apple.com/favicon.ico',
            url: 'http://images.apple.com/main/rss/hotnews/hotnews.rss' } ]
##dependency
node-find-rss uses [node-icu-charset-detector](https://github.com/mooz/node-icu-charset-detector),and require **livicu-dev** or **icu4c**.

    # ubuntu and debian-based systems
    apt-get install libicu-dev
    # os x
    port install icu +devel                 # with macports
    brew install icu4c && brew link icu4c   # homebrew
