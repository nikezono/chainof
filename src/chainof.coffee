###
#
# chainof.coffee
# Author:nikezono
#
###

module.exports = ->

  functions = []

  use: (func)->
    throw new Error("Incompatible Type is used for chainof")

  length: ->
    return functions.length

  clear: ->
    functions = []
