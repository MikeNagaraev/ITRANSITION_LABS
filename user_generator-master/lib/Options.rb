class Options
	attr_reader :location, :count, :probability

	#!!!!!!!
	RU = "RU"
	BY = "BY"
	US = "US"

	def errors?
		@errors.any?
	end

	def errors
		@errors
	end

	private

	def initialize(args)
		@errors = []
		@location = RU
		@count = 0
		@probability = 0

		OptionParser.new do |opts|
	  	opts.banner = "Usage: user_generator.rb [options]"

 		#opts.on("-l", "--location [:#{RU}, :#{BY}, :#{US}]", "Location of generated users") do |loc|
			if !args[0].match("^#{BY}$|^#{RU}$|^#{US}$").nil?
	    		@location = args[0]
			else
				@errors << "Wrong location of watermark. Aborted!"
			end
  		#end

	  	#opts.on("-c", "--count NUMBER", "Count of records") do |c|
	  		if !args[1].match("^[0-9]+$").nil?
	    		@count = args[1].to_i
	  		else
	  			@errors << "Is not number. Aborted! #{c}"
			end
	  	#end

	  	#opts.on("-p", "--probability NUMBER", "Probability error in record") do |p|
	  		if !args[2].match("^[0-9]+$").nil?
          		@probability = args[2].to_i
	    	else
          		@errors << "Is not valid number. Aborted! #{p}"
			end
	  	#end
		end.parse!
	end
end
