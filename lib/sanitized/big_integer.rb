# frozen_string_literal: true

module Sanitized
  ##
  # Sanitized::BigInteger
  #
  # An ActiveModel::Type that casts and sanitizes a model's BigInt attribute 
  # according to the options specified on initialisation.
  #
  # @example
  #   type_cast = Sanitized::BigInt.new(:abs) do |value|
  #       ... custome code ...
  #   end
  #   attribute :attr_name, type_cast, default: 123
  # 
  class BigInteger < ::ActiveModel::Type::BigInteger

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
    #
    def self.valid_options
      {
        abs: []
      }
    end

  end # class Type
end # module
