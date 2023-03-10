# frozen_string_literal: true

module Sanitized
  ##
  # Sanitized::DateTime
  #
  # An ActiveModel::Type that casts and sanitizes a model's DateTime attribute 
  # according to the options specified on initialisation.
  #
  # @example simple example
  #   attribute :attr_name, Sanitized::DateTime.new(:end_of_week, :at_noon), default: Time.now
  # 
  # @example with optional custom block
  #   type_cast = Sanitized::DateTime.new(:beginning_of_week, :at_noon) do |value|
  #       ... custome code ...
  #   end
  #   attribute :attr_name, type_cast, default: Date.today
  #
  class DateTime < ::ActiveModel::Type::DateTime

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
    #   both :at_midnight and :at_noon at the same time.
    #
    def self._valid_options
      {
        at_beginning_of_day:      self.exclusive_options,
        at_beginning_of_hour:     self.exclusive_options,
        at_beginning_of_minute:   self.exclusive_options,
        at_beginning_of_month:    self.exclusive_options,
        at_beginning_of_quarter:  self.exclusive_options,
        at_beginning_of_week:     self.exclusive_options,
        at_beginning_of_year:     self.exclusive_options,
        at_end_of_day:            self.exclusive_options,
        at_end_of_hour:           self.exclusive_options,
        at_end_of_minute:         self.exclusive_options,
        at_end_of_month:          self.exclusive_options,
        at_end_of_quarter:        self.exclusive_options,
        at_end_of_week:           self.exclusive_options,
        at_end_of_year:           self.exclusive_options,
        at_midday:                self.exclusive_options,
        at_middle_of_day:         self.exclusive_options,
        at_midnight:              self.exclusive_options,
        at_noon:                  self.exclusive_options,
        beginning_of_day:         self.exclusive_options,
        beginning_of_hour:        self.exclusive_options,
        beginning_of_minute:      self.exclusive_options,
        beginning_of_month:       self.exclusive_options,
        beginning_of_quarter:     self.exclusive_options,
        beginning_of_week:        self.exclusive_options,
        beginning_of_year:        self.exclusive_options,
        end_of_month:             self.exclusive_options,
        end_of_quarter:           self.exclusive_options,
        end_of_week:              self.exclusive_options,
        end_of_year:              self.exclusive_options,
        end_of_day:               self.exclusive_options,
        end_of_hour:              self.exclusive_options,
        end_of_minute:            self.exclusive_options,
        midday:                   self.exclusive_options,
        middle_of_day:            self.exclusive_options,
        midnight:                 self.exclusive_options,
        noon:                     self.exclusive_options
      }
    end



    # @retrun [Array] of the options that modify both the date and the time
    def self.exclusive_options
      [
        :at_beginning_of_day,
        :at_beginning_of_hour,
        :at_beginning_of_minute,
        :at_beginning_of_month,
        :at_beginning_of_quarter,
        :at_beginning_of_week,
        :at_beginning_of_year,
        :at_end_of_day,
        :at_end_of_hour,
        :at_end_of_minute,
        :at_end_of_month,
        :at_end_of_quarter,
        :at_end_of_week,
        :at_end_of_year,
        :at_midday,
        :at_middle_of_day,
        :at_midnight,
        :at_noon,
        :beginning_of_day,
        :beginning_of_hour,
        :beginning_of_minute,
        :beginning_of_month,
        :beginning_of_quarter,
        :beginning_of_week,
        :beginning_of_year,
        :end_of_month,
        :end_of_quarter,
        :end_of_week,
        :end_of_year,
        :end_of_day,
        :end_of_hour,
        :end_of_minute,
        :midday,
        :middle_of_day,
        :midnight,
        :noon
      ]
    end

  end # class Type
end # module
