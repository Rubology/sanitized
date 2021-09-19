# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'

RSpec.describe "String: Defined as an Attribute" do

  #  It opperates correctly when assigned as an attribute
  # ======================================================================

  before(:each) do
    class AttributeTest < ActiveRecord::Base
      self.table_name = 'examples'

      type_cast = Sanitized::String.new(:squish, :upcase) do |value|
        value == 'ABCDE' ? value.reverse : value
      end

      attribute :name, type_cast, default: 'CodeMeister'
    end
  end

  after(:each) { Object.send(:remove_const, :AttributeTest) }

  subject { AttributeTest.new }

  it "returns the correct string for multiple options" do
    subject.name = '  big_test  message  '
    expect(subject.name).to eq "BIG_TEST MESSAGE"
  end


  it "returns the correct string for a given block" do
    subject.name = 'abcde'
    expect(subject.name).to eq 'EDCBA'
  end


  it "acts as expected with a non-string value" do
    subject.name = BasicObject.new
    expect(subject.name).to be_nil
  end


  it "doesn't interfere with the standard attribute parameters" do
    expect(subject.name).to eq 'CODEMEISTER'
  end
end 
