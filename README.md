chainof [![Build Status](https://travis-ci.org/nikezono/chainof.png)](https://travis-ci.org/nikezono/chainof)
---

[![NPM](https://nodei.co/npm/chainof.png)](https://nodei.co/npm/chainof/)

function chain,like [connect](http://www.senchalabs.org/connect/)

##install

***using npm:***

    npm install chainof

****or using package.json:***

    "chainof": "*"

##Example

    # CoffeeScript
    ChainOf = require 'chainof'
    chain   = new ChainOf

    chain.use (args,next)->
      next()
    chain.use (args,next)->
      args.ping = "pong"
      next()
    testFunc = (args,next)->
      args.pong = -> return "func"
      next()
    chain.use testFunc
    chain.use ->
      return "hoge"
    chain.use ->
      return "never"

    chain.length() # -> 4
    res = chain.run() # -> "hoge". not "never"
    chain.variables.ping # -> "pong"
    chain.variables.pong() #-> "func"

## APIs

* chain.clear()
* chain.length()
* chain.add(Function func)
  * function(args,next)
* chain.run()
