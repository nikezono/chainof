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
    for func in functions
      response = func(args,next)
      @extend(args)
      return response if response

  variables: variables

  ### Private Methods ###
  extend: (obj) ->
    for key, value of obj
      variables[key] = value

module.exports = Chainof
