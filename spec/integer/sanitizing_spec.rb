# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'

RSpec.describe "Integer: Sanitizing" do

  #  It modifies the value correctly
  # ======================================================================
  
  describe 'it sanitizes correctly with' do
    it ':abs' do
      expect(Sanitized::Integer.new(:abs).cast(-123)).to eq 123
    end

    it "a custom block being given" do
      cs = Sanitized::Integer.new() { |value| value * 10 }
      expect(cs.cast(123)).to eq 1230
    end
  end # 'it correctly sanitizes the value on'
end 
