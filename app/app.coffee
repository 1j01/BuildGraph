
E = (tagName)-> document.createElement(tagName or "div-soup")
$G = $(window)
$.fn.rect = -> @[0].getBoundingClientRect()

lerp = (a,b,x)-> (b-a)*x+a

FRICTION = 4
MAX_VELOCITY = 55
IDEAL_DISTANCE = 1
G = 1

class WireSegment
	
	constructor: (@x = 0, @y = 0)->
		@connections = []
		@fx = @fy = @vx = @vy = 0
		
	update: ->
		@fx = 0
		@fy = G
		
		for s in @connections
			dx = s.x - @x # distance in x
			dy = s.y - @y # distance in y
			d = Math.sqrt(dx * dx + dy * dy) #distance
			dd = d - IDEAL_DISTANCE # difference between distance and ideal distance
			f = dd / 30 # force
			
			@fx += dx * f
			@fy += dy * f
		
		for node in Node.s
			rect = node.$.rect()
			if @x > rect.left and @x < rect.left + rect.width
				if @y > rect.top and @y < rect.top + rect.height
					
					#@fx -= dx * f
					@fy -= 50
		
		@vx += @fx
		@vy += @fy
		@vx /= 1 + FRICTION
		@vy /= 1 + FRICTION
		@vx = Math.min(Math.max(@vx, -MAX_VELOCITY), MAX_VELOCITY)
		@vy = Math.min(Math.max(@vy, -MAX_VELOCITY), MAX_VELOCITY)
		@x += @vx
		@y += @vy
			
	draw: (x)->
		d = 2
		x.fillRect(@x - d/2, @y - d/2, d, d)
		
		for other_node in @connections
			x.moveTo(@x, @y)
			x.lineTo(other_node.x, other_node.y)
		
	
class Wire
	constructor: ->
		@segments = (new WireSegment() for i in [0..20])
		for i in [1...@segments.length]
			@segments[i+0].connections.push(@segments[i-1])
			@segments[i-1].connections.push(@segments[i+0])
		@input = {x:0, y:0}
		@output = {x:0, y:0}
		
	stretch: ->
		for s, i in @segments
			s.x = lerp(@input.x, @output.x, i/@segments.length)
			s.y = lerp(@input.y, @output.y, i/@segments.length)
	
	update: ->
		L = @segments.length - 1
		@segments[0].x = @input.x
		@segments[0].y = @input.y
		@segments[L].x = @output.x
		@segments[L].y = @output.y
		s.update() for s in @segments
	
	draw: (ctx)->
		ctx.beginPath()
		ctx.moveTo(@segments[0].x, @segments[0].y)
		
		for i in [1...@segments.length]
		#for s in @segments
			#ctx.lineTo(s.x, s.y)
			ctx.quadraticCurveTo(@segments[i-1].x, @segments[i-1].y, @segments[i].x, @segments[i].y)
		
		ctx.lineWidth = 9
		ctx.strokeStyle = '#111'
		ctx.stroke()
		ctx.lineWidth = 6
		ctx.strokeStyle = '#555'
		ctx.stroke()
		ctx.lineWidth = 2
		ctx.strokeStyle = '#999'
		ctx.stroke()
		

class Node
	@s = []
	
	constructor: ($container)->
		Node.s.push(@)
		
		@files = {}
		
		@inputs = []
		@outputs = []
		
		@$inputs = $(E "plug-group").addClass("inputs")
		@$outputs = $(E "plug-group").addClass("outputs")
		
		@$ = $ E "node-component"
		@$.append(@$inputs, @$outputs)
		@$.appendTo("body")
		@$.css position: "absolute"
		@$.css
			left: 50
			top: 50
		
		mox = moy = 0
		mousedrag = (e)=>
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
		@$o = $ E "plug-out"
		@$o.appendTo(@$outputs)
	

class UselessNode extends Node
	constructor: ($container, bla)->
		super($container)
		@addInput
			desc: "Completely useless."
			type: "files"
		
		$(E "p").text(bla).appendTo(@$)
	

class Project
	constructor: (dir)->
		canvas = E "canvas"
		ctx = canvas.getContext("2d")
		$container = $ E "project"
		$("body").append($container)
		$container.append(canvas)
		
		n = new UselessNode($container, "Hello World Node!")
		
		wire = new Wire()
		wire.input = {x:50, y:60}
		wire.output = {x:500, y:70}
		wire.stretch()
		
		do a = ->
			requestAnimationFrame(a)
			canvas.width = window.innerWidth
			canvas.height = window.innerHeight
			wire.update()
			wire.draw(ctx)

project = new Project(process.cwd())

