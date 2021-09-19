# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'

RSpec.describe "BigInteger: Initializing" do

  # = Invalid Opts
  # ======================================================================

  describe "when an invalid option is given" do

    it "raises an exception with an invalid symbol option" do
      msg = ':dummy is not a valid option.'
      expect{Sanitized::BigInteger.new(:dummy)}.to raise_error(ArgumentError, msg)
    end

    it "raises an exception with a non-symbol option" do
      msg = "Options must be a Symbol, not String."
      expect{Sanitized::BigInteger.new('strip')}.to raise_error(ArgumentError, msg)
    end
  end
end 
