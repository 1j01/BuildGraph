
NwBuilder = require '../node-webkit-builder'

nwb = new NwBuilder
	files: 'app/**/*'

nwb.on 'log', (msg)->
	console.log(msg)

#=======================================================#

task 'run', ->
	nwb.run()

task 'build', ->
	nwb.build().catch (error)->
		console.log(error)

# task sublime runs on Ctrl-B
task 'sbuild', ->
	invoke 'run'
