# frozen_string_literal: true


##
# Version for Sanitized::String
#
module Sanitized

  # Returns the version of the currently loaded StateMachine as a <tt>Gem::Version</tt>
  def self.gem_version
    Gem::Version.new VERSION::STRING
  end

  module VERSION

    MAJOR = 0
    MINOR = 7
    TINY  = 4
    # MICRO = ''

    STRING = [MAJOR, MINOR, TINY].compact.join(".")
    # STRING = [MAJOR, MINOR, TINY, MICRO].compact.join(".")

  end

end
