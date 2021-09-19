# frozen_string_literal: true

module Sanitized

  ##
  # = Description
  #
  # ActiveModel::Type to cast and sanitize a model's Float attribute according to the 
  # options specified on initialisation.
  #
  # attribute :attr_name, Sanitized::Float.new(:abs, :ceil), default: 123.45
  #
  # Can optionally include a custom block:
  #   type_cast = Sanitized::Float.new(:abs, :ceil) do |value|
  #       ... custome code ...
  #   end
  #   attribute :attr_name, type_cast, default: 123.45
  #
  class Float < ::ActiveModel::Type::Float

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
        abs:       [:magnitude],
        ceil:      [:floor],
        floor:     [:ceil],
        magnitude: [:abs],
        truncate:  [],
      }
    end

  end # class Type
end # module
