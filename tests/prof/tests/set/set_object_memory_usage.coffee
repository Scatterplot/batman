Batman = require '../../batman'
Watson = require 'watson'
Clunk  = require '../lib/clunk.coffee'

set = new Batman.Set

Watson.trackMemory 'set memory usage with objects', 10000, (i) ->
  set.add new Clunk
  if i % 2000 == 0
    set.clear()
