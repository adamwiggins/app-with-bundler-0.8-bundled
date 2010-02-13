$LOAD_PATH.unshift 'vendor/gems/ruby/1.8/gems/bundler-0.8.1/lib'
require 'bundler'

require 'vendor/gems/environment'
Bundler.require_env

if defined?(RestClient)
	puts "It worked!"
else
	abort "Damn"
end
