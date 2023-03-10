# frozen_string_literal: true

module Sanitized
  ##
  # Sanitized::String
  #
  # An ActiveModel::Type that casts and sanitizes a model's String attribute 
  # according to the options specified on initialisation.
  #
  # @example simple example
  #   attribute :attr_name, Sanitized::String.new(:squish, :upcase), default: 'CodeMeister'
  #
  # @example with optional custom block
  #   type_cast = Sanitized::String.new(:squish, :upcase) do |value|
  #       ... custome code ...
  #   end
  #   attribute :attr_name, type_cast, default: 'CodeMeister'
  # 
  class String < ::ActiveModel::Type::String

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
    #   where each key is a valid _sanitize option and the body is an <code>Array</code>
    #   of options that are mutually exclusive. E.g. you cannot have 
    #   both :upcase and :downcase at the same time.
    #
    def self._valid_options
      case_opts = [:capitalize, :camelcase, :camelize, :dasherize, :downcase, :humanize,
                   :parameterize, :swapcase, :titlecase, :titleize, :underscore, :upcase,
                   :upcase_first]
      {
        capitalize:   case_opts,
        camelcase:    case_opts,
        camelize:     case_opts,
        chomp:        [],
        dasherize:    case_opts,
        downcase:     case_opts,
        humanize:     case_opts,
        lstrip:       [],
        parameterize: case_opts,
        rstrip:       [],
        singularize:  [],
        squish:       [],
        strip:        [],
        swapcase:     case_opts,
        titlecase:    case_opts,
        titleize:     case_opts,
        underscore:   case_opts,
        upcase:       case_opts,
        upcase_first: case_opts
      }
    end

  end # class Type
end # module
