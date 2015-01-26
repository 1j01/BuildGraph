
NwBuilder = require '../node-webkit-builder'
CoffeeScript = require 'coffee-script'
print = console.log

#=======================================================#

nwb = new NwBuilder
	files: 'app/**/*'

nwb.on 'log', (msg)->
	print msg

#=======================================================#

task 'compile', ->
	return
	for fname in ['app']
		CoffeeScript._compileFile "app/#{fname}.coffee"
		print "Compiled #{fname}.coffee"

task 'run', ->
	invoke 'compile'
	nwb.run()

task 'build', ->
	invoke 'compile'
	nwb.build().catch (error)->
		print error

# task sublime runs on Ctrl-B
task 'sbuild', ->
	invoke 'run'
