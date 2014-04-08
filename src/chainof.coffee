###
#
# chainof.coffee
# Author:nikezono
#
###

class Chainof

  ### Fields ###
  functions = []
  variables = {}

  ### Constructor ###
  constructor: ->
    functions = []

  ### Public APIs ###
  use: (func)->
    if typeof(func) isnt "function"
      throw new Error("Incompatible Type is used for chainof")
    functions.push func

  length: -> return functions.length

  clear: -> functions = []

  # @todo function mergeしてstop()メソッドがあるメソッドとマージする
  run: (args)->
    that = this
    stack = 0
    nullobj = {
      res:null
      args:args
    }
    next = ->
      stack++
      if functions[stack-1] is undefined || null
        return nullobj
      response = functions[stack-1](args,next)
      if response && response isnt nullobj
        return {
          res:response
          args:args
        }
      return nullobj

    val = next()
    console.log val
    @extend(val.args)
    return val.res

  variables: variables

  ### Private Methods ###
  extend: (obj) ->
    for key, value of obj
      variables[key] = value

module.exports = Chainof
