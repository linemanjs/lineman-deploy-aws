module.exports = (lineman) ->
	config:
		loadNpmTasks: lineman.config.application.loadNpmTasks.concat("grunt-aws")
	

