// Generated by CoffeeScript 1.6.3
/*
#
# chainof.coffee
# Author:nikezono
#
*/

var Chainof;

Chainof = (function() {
  /* Fields*/

  var functions, variables;

  functions = [];

  variables = {};

  /* Constructor*/


  function Chainof() {
    functions = [];
  }

  /* Public APIs*/


  Chainof.prototype.use = function(func) {
    if (typeof func !== "function") {
      throw new Error("Incompatible Type is used for chainof");
    }
    return functions.push(func);
  };

  Chainof.prototype.length = function() {
    return functions.length;
  };

  Chainof.prototype.clear = function() {
    return functions = [];
  };

  Chainof.prototype.run = function(args) {
    var index, next, that;
    that = this;
    if (!args) {
      args = {};
    }
    index = 0;
    next = function() {
      var func, response;
      func = functions[index++];
      if (!func) {
        return null;
      }
      response = func(args, next);
      that.extend(args);
      if (response) {
        return response;
      }
      return null;
    };
    return next();
  };

  Chainof.prototype.variables = variables;

  /* Private Methods*/


  Chainof.prototype.extend = function(obj) {
    var key, value, _results;
    _results = [];
    for (key in obj) {
      value = obj[key];
      _results.push(variables[key] = value);
    }
    return _results;
  };

  return Chainof;

})();

module.exports = Chainof;
