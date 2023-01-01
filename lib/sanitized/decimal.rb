# frozen_string_literal: true

module Sanitized
  ##
  # Sanitized::Decimal
  #
  # An ActiveModel::Type that casts and sanitizes a model's Decimal attribute 
  # according to the options specified on initialisation.
  #
  # @example simple example
  #   attribute :attr_name, Sanitized::Decimal.new(:abs, :ceil), default: 123.45
  #
  # @example with optional custom block
  #   type_cast = Sanitized::Decimal.new(:abs, :ceil) do |value|
  #       ... custome code ...
  #   end
  #   attribute :attr_name, type_cast, default: 123.45
  # 
  class Decimal < ::ActiveModel::Type::Decimal

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
    #   where each key is a valid sanitize option and the body is an <code>Array</code>
    #   of options that are mutually exclusive. E.g. you cannot have 
    #   both :floor and :ceil at the same time.
    #
    def self.valid_options
      {
        abs:      [],
        ceil:     [:floor],
        floor:    [:ceil],
        truncate: []
      }
    end

  end # class Type
end # module
