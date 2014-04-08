# test dependency
path = require 'path'
assert  = require 'assert'

Chainof = require path.resolve('lib','chainof')

describe "chainof", ->
  chainer = {}

  beforeEach ->
    chainer = new Chainof

  it "store出来る",->
    chainer.use -> return "Run1"
    assert.equal chainer.length(), 1

  it "function以外はstore出来ない",->
    assert.throws ->
      chainer.use(2)
    ,Error

  it "run出来る/returnが帰る", ->
    chainer.use -> return "Run2"
    assert.equal chainer.run(), "Run2"

  it "clear出来る",->
    chainer.use -> return "Run3"
    chainer.clear()
    assert.equal chainer.length(),0

  it "複数Store出来る",->

    # set arguments
    chainer.use (args,next) ->
      args.ping = "pong"
      next()

    chainer.use -> return "Run4"

    assert.equal chainer.length(),2

  it "argsを変更できる",->

    # set arguments
    chainer.use (args,next) ->
      args.ping = "pong"
      next()

    args = {}
    chainer.run(args)
    assert.equal chainer.variables.ping, "pong"

  it "returnされた時点で終わる", ->

    chainer.use -> return "Run5"
    chainer.use -> return "Never"

    value = chainer.run()
    assert.equal value,"Run5"

  it "next()すると以降が飛ばされる", ->
    chainer.use (args,next)->
      next()
      return "Never"
    value = chainer.run()
    assert.equal value,null
