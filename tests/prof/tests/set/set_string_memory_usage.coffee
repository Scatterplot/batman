Batman = require '../../batman'
Watson = require 'watson'
Clunk  = require '../lib/clunk.coffee'

set = new Batman.Set

Watson.trackMemory 'set memory usage with strings', 10000, (i) ->
  set.add "fooooooo" + i
  if i % 2000 == 0
    set.clear()


