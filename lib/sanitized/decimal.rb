# frozen_string_literal: true

module Sanitized

  ##
  # = Description
  #
  # ActiveModel::Type to cast and sanitize a model's Decimal attribute according to the 
  # options specified on initialisation.
  #
  # attribute :attr_name, Sanitized::Decimal.new(:abs, :ceil), default: 123.45
  #
  # Can optionally include a custom block:
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
    # Returns a Hash of valid options with the other options they are exclusive with
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
