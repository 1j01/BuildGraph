
E = (tagName)-> document.createElement(tagName or "div-soup")
$G = $(window)
$.fn.rect = -> @[0].getBoundingClientRect()

class Node
	
	constructor: ->
		@files = {}
		
		@inputs = []
		@outputs = []
		
		@$inputs = $ E "plug-group"
		@$outputs = $ E "plug-group"
		
		@$ = $ E "node-component"
		@$.append(@$inputs, @$outputs)
		@$.appendTo("body")
		@$.css position: "absolute"
		
		mox = moy = 0
		mousedrag = (e)=>
			console.log mox, moy
			@$.css
				left: e.clientX - mox
				top: e.clientY - moy
		
		@$.on "mousedown", (e)=>
			e.preventDefault()
			mox = e.clientX - @$.rect().left
			moy = e.clientY - @$.rect().top
			$G.on "mousemove", mousedrag
			$G.on "mouseup", =>
				$G.off "mousemove", mousedrag
		
	addInput: ({desc})->
		@$i = $ E "plug-in"
		@$i.appendTo(@$inputs)
	
	addOutput: ({desc})->
		@$o = $ E "plug-in"
		@$o.appendTo(@$outputs)
	

class UselessNode extends Node
	constructor: (bla)->
		super()
		$(E "p").text(bla).appendTo(@$)
	

class Project
	constructor: (dir)->
		n = new UselessNode("Hello World Node!")
	

project = new Project(process.cwd())
