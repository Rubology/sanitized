# frozen_string_literal: true

module Sanitized
  ##
  # = Description
  #
  # ActiveModel::Type to cast and sanitize a model's BigInt attribute according to the
  # options specified on initialisation.
  #
  # attribute :attr_name, Sanitized::BigInt.new(:abs), default: 123
  #
  # Can optionally include a custom block:
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
    # Returns a Hash of valid options with the other options they are exclusive with
    #
    def self.valid_options
      {
        abs: []
      }
    end

  end # class Type
end # module
