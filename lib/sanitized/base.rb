# frozen_string_literal: true

module Sanitized
  ##
  # Base methods for all Sanitized classes
  #
  module Base # :nodoc:

    ##
    # sanitize the value according to the options provided on initialization.
    #
    def cast(value) # :nodoc:
      val = super
      val = sanitize(val)
      val = @block.call(val) if @block.present?
      return val
    rescue
      nil
    end



    # public reader for set options
    def options
      @options ||= []
    end





    # ======================================================================
    # = Private
    # ======================================================================
    private

    # Set the options, record the block and verfiy that every given option is valid
    #
    # [:opts]
    #   An Array of Symbol options to be run with every :cast
    #
    # [:block]
    #   An optional block to be run with every :cast
    #
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



    # raise an exception if any given option is invalid
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



    # raise an error based on the invalid option
    def fail_invalid_option(opt)
      if opt.is_a?(Symbol)
        fail ArgumentError, ":#{opt.to_s} is not a valid option."
      else
        fail ArgumentError, "Options must be a Symbol, not #{opt.class.name}."
      end
    end



    # return a Hash of valid options with the other options they are exclusive with
    def valid_options
      self.class.valid_options
    end



    # apply the required sanitization to the vlaue.
    def sanitize(value) # :nodoc
      result = value
      options.each { |opt| result = result.send(opt) }
      return result
    end

  end # base
end # sanitized
