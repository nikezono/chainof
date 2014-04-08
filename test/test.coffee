# test dependency
path = require 'path'
assert  = require 'assert'

chainof = require './lib/chainof'

describe "chainof", ->

  # set function
  chainof.use ->
    return "Run"

  it "store出来る",->
    assert.equal chainof.length, 1

  it "function以外はstore出来ない",->
    assert.throws chainof.use(2)

  it "run出来る/returnが帰る", ->
    assert.equal chainof.run(), "Run"

  chainof.clear()

  it "clear出来る",->
    assert.equal chainof.length,0

  # set arguments
  chainof.use (args,next) ->
    args.ping = "pong"
    next()

  chainof.use ->
    return "Run"

  it "複数Store出来る",->
    assert.equal chainof.length,2

  it "argsを変更できる",->
    args = {}
    chainof.run(args)
    assert.equal chainof.ping, "pong"

  chainof.use ->
    return "never"

  it "returnされた時点で終わる", ->
    value = chainof.run()
    assert.equal value,"Run"

