require "./lib/Options"
require "./lib/Generator"
# require 'profile'


if(ARGV.length!=3)
	puts "Not a valid parameters"
	puts "Example: RU 100 1"
	exit(0)
end

options = Options.new(ARGV)

if options.errors?
	options.errors.each { |e| puts e }
	exit(0)
end

Generator.generate options

