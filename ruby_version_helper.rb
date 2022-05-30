class RubyVersionHelper

	class << self
		def latest?
			version?(3.1)
		end



		def version?(expected = nil)
			expected = String(expected)
			current_version = Gem::Version.new(RUBY_VERSION)
																	  .canonical_segments[0..1]
																	  .join('.')

			expected == current_version
		end	



		def current_version(separator = '.')
			@current_version ||= Gem::Version.new(RUBY_VERSION)
																	     .canonical_segments[0..1]
																	     .join(separator)
		end
	end
end	
