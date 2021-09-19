# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'

RSpec.describe "Float: Sanitizing" do

  #  It modifies the value correctly
  # ======================================================================
  
  describe 'it sanitizes correctly with' do
    it ':abs' do
      expect(Sanitized::Float.new(:abs).cast(-123.45)).to eq 123.45
    end

    it ':ceil' do
      expect(Sanitized::Decimal.new(:ceil).cast(23.45)).to eq 24
    end

    it ':abs' do
      expect(Sanitized::Decimal.new(:floor).cast(23.45)).to eq 23
    end

    it ':magnitude' do
      expect(Sanitized::Float.new(:magnitude).cast(-123.45)).to eq 123.45
    end

    it ':truncate' do
      expect(Sanitized::Decimal.new(:truncate).cast(23.45)).to eq 23
    end

    it "a custom block being given" do
      cs = Sanitized::Float.new() { |value| value * 10 }
      expect(cs.cast(123)).to eq 1230
    end
  end # 'it correctly sanitizes the value on'
end 
