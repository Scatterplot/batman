Batman = require '../../batman'
Watson = require 'watson'
jsdom = require 'jsdom'

Watson.makeADom()

loopSource = '''
<div data-foreach-obj="objects">
  <span data-bind="obj"></span>
  <span data-bind="obj"></span>
  <span data-bind="obj"></span>
  <span data-bind="obj"></span>
  <span data-bind="obj"></span>
  <span data-bind="obj"></span>
</div>
'''

# Batman.Renderer::deferEvery = false if Batman.Renderer::deferEvery

Watson.trackMemory 'view memory usage: simple', 400, {step: 10, async: true}, (i, next) ->
  node = document.createElement 'div'
  node.innerHTML = loopSource
  context = Batman(objects: new Batman.Set([0...50]))

  view = new Batman.View
    contexts: [context]
    node: node

  finish = ->
    Batman.DOM.destroyNode(node)
    next()

  if view.on?
    view.on 'ready', finish
  else
    view.ready finish
