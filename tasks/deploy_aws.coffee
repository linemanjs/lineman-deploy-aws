module.exports = (grunt) ->

	grunt.registerTask "lineman-deploy-aws", "deploy to AWS", (target) ->
		config = grunt.config.get('deployment.' + target)

		# Failsafe here
		if config.method isnt 'aws'
			return grunt.log.error('Deployment method for target "' + target + '" is not AWS - aborting!')

		# Config already checked in the core deploy task


		# Copy config over to s3 so that grunt task can read it
		
		grunt.config.set 's3', 
			options:
				accessKeyId:config.accessKey
				secretAccessKey:config.secretKey
				bucket:config.bucket
				sslEnabled:false
			lineman:
				cwd:'dist/'
				src:'**'
		tasks = ['s3:lineman']

		grunt.task.run(tasks)