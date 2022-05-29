# Needed for github actions: bundle lock --add-platform x86_64-linux

source 'https://rubygems.org'

# load the mionimum gems needed for testing appraisals
gem 'amazing_print'
gem 'appraisal'
gem 'byebug'
gem 'rake', 	'~> 13.0'
gem 'rspec', 	'~> 3.0'


# load the development gems if using Ruby 3.1
if Gem::Version.new(RUBY_VERSION).to_s.start_with?('3.1')
	gem 'rack'
	gem 'puma'
	gem 'rubocop'
	gem 'sdoc'
	gem 'simplecov'
	gem 'simplecov-cobertura'
end


