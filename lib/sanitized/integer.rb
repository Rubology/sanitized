# frozen_string_literal: true

module Sanitized
  ##
  # Sanitized::Integer
  #
  # An ActiveModel::Type that casts and sanitizes a model's Integer attribute 
  # according to the options specified on initialisation.
  #
  # @example simple example
  #   attribute :attr_name, Sanitized::Integer.new(:abs), default: 123
  #
  # @example with optional custon block
  #   type_cast = Sanitized::Integer.new(:abs) do |value|
  #       ... custome code ...
  #   end
  #   attribute :attr_name, type_cast, default: 123
  # 
  class Integer < ::ActiveModel::Type::Integer

    # ======================================================================
    #  Macros
    # ======================================================================

    include Sanitized::Base



    # ======================================================================
    #  Class Methods
    # ======================================================================

    ##
    # Returns a Hash of valid options and their excusivity.
    # @return [Hash]
    #   where each key is a valid sanitize option.
    def self.valid_options
      {
        abs: []
      }
    end

  end # class Type
end # module
