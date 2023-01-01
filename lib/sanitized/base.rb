# frozen_string_literal: true

module Sanitized
  ##
  # Sanitized::Base
  #
  # The core methods for all Sanitized classes
  #
  # @private
  #
  module Base
    
    ##
    # Sanitizes the value according to the options set for the attribute.
    #
    # @param  value 
    #   the value to be sanitized. Class depends on the Sanitized model.
    #
    # @return [*any] 
    #   the sanitized value. Class depends on the Sanitized model.
    #
    # @return [NilClass] 
    #   <code>nil</code> on error.
    #
    # @note
    #   The actions taken and class accepted/returned depend on the 
    #   attribute settings when initialized. E.g. Sanitized::String
    #   accepts and returns a String class.
    #
    def cast(value)
      val = super
      val = sanitize(val)
      val = @block.call(val) if @block.present?
      return val
    rescue
      nil
    end



    # public reader for set options
    ##
    # Returns the configuration options for the attribute.
    #
    # @return [Array]
    #   configuration options for the attribute.
    #    
    def options
      @options ||= []
    end





    # ======================================================================
    # = Private
    # ======================================================================
    private

    ##
    # Sets and validates the options for the attribute, and records any custom block.
    #
    # @param [Array] opts
    #   an Array of Symbols defining each sanitize method to perform.
    #
    # @param [&block] block
    #   a custom Proc to be run after any opts have been applied.
    #
    # @return
    #   the instantiated object.
    #
    # @raise [ArgumentError]
    #   when an invalid option is provided.
    #    
    # @example
    #   attribute :title, Sanitized::String.new(:squish, :titleize) do |value|
    #     value += '.' unless value.ends_with?('.')
    #   end
    #
    def initialize(*opts, &block)
      @options = []
      @block   = block if block_given?

      assert_valid_options(opts)
      super()
    end



    ##
    # Verifies each option is valid.
    #
    # @param [Array] opts
    #   an Array of Symbols where each symbol is verified.
    #
    # @raise [ArgumentError]
    #   when an option is not included within the accepted list
    #   or is mututally exlcusive with another option.
    #
    def assert_valid_options(opts)
      opts.each do |opt|
        fail_invalid_option(opt) unless valid_options.keys.include?(opt)

        # check for exclusive options
        if valid_options[opt].present? and options.present?
          valid_options[opt].each do |exclusive_opt|
            if options.include?(exclusive_opt)
              msg = ":#{opt.to_s} and :#{exclusive_opt} are mutually exclusive."\
                    " You may only use one or the other."
              fail ArgumentError, msg
            end
          end
        end

        options << opt
      end # each |opt|
    end



    # Raises an error based on the invalid option
    #
    # @param opt
    #   the invalid option to raise an error for.
    #
    # @raise [ArgumentError]
    #   message describing the error.
    #
    def fail_invalid_option(opt)
      if opt.is_a?(Symbol)
        fail ArgumentError, ":#{opt.to_s} is not a valid option."
      else
        fail ArgumentError, "Options must be a Symbol, not #{opt.class.name}."
      end
    end



    ##
    # @return [Hash]
    #   valid options with the other options they are exclusive with.
    def valid_options
      self.class.valid_options
    end



    ##
    # Applies the required sanitization options to the value.
    #
    # @param value
    #   the value to be sanitized. Class is dependent on the sanitized model used.
    #
    # @return
    #   the sanitized value. Class is dependent on the sanitized model used.
    #
    def sanitize(value) # :nodoc
      result = value
      options.each { |opt| result = result.send(opt) }
      return result
    end

  end # base
end # sanitized
