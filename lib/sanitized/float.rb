# frozen_string_literal: true

module Sanitized
  ##
  # Sanitized::Float
  #
  # An ActiveModel::Type that casts and sanitizes a model's Float attribute 
  # according to the options specified on initialisation.
  #
  # @example simple example
  #   attribute :attr_name, Sanitized::Float.new(:abs, :ceil), default: 123.45
  #
  # @example with optional custom block
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
    # Returns a Hash of valid options and their excusivity.
    # @return [Hash]
    #   where each key is a valid sanitize option and the body is an <code>Array</code>
    #   of options that are mutually exclusive. E.g. you cannot have 
    #   both :floor and :ceil at the same time.
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
