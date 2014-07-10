Batman = require '../../batman'
Watson = require 'watson'
Clunk  = require '../lib/clunk.coffee'
Random = require '../lib/number_generator.coffee'

# Batman.Set::indexedBy(key) returns a Batman.SetIndex
Watson.ensureCommitted '540d76c21a03212d843b632bdad9e61c3b6d2b8a', ->

  ITERATONS = 3000

  generator = new Random(0, 10, 3000)

  set = new Batman.Set
  index = set.indexedBy('foo')

  Watson.trackMemory 'set index memory usage', ITERATONS, 10, (i) ->
    set.add new Clunk(foo: generator.next())
    if i % 500 == 0
      set.clear()

    array = index.get('toArray')
