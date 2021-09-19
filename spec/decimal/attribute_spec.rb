# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'

RSpec.describe "Decimal: Defined as an Attribute" do

  #  It opperates correctly when assigned as an attribute
  # ======================================================================

  before(:each) do
    class AttributeTest < ActiveRecord::Base
      self.table_name = 'examples'

      type_cast = Sanitized::Decimal.new(:abs) do |value|
         value = (value == 246 ? 642 : value)
      end

      attribute :age, type_cast, default: -123
    end
  end

  after(:each) { Object.send(:remove_const, :AttributeTest) }

  subject { AttributeTest.new }

  it "returns the correct value for a given block" do
    subject.age = -246
    expect(subject.age).to eq 642
  end


  it "acts as expected with a non-bigint value" do
    subject.age = BasicObject.new
    expect(subject.age).to be_nil
  end


  it "doesn't interfere with the standard attribute parameters" do
    expect(subject.age).to eq 123
  end
end 
