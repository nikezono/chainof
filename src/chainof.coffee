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
    that = @
    args = {} unless args
    index = 0
    next = ->
      func = functions[index++]
      return null if !func
      response = func(args,next)
      that.extend(args)
      if response
        return response
      return null
    next()


  variables: variables

  ### Private Methods ###
  extend: (obj) ->
    for key, value of obj
      variables[key] = value

module.exports = Chainof
