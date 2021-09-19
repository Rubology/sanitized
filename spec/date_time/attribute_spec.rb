# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'

RSpec.describe "DateTime: Defined as an Attribute" do

  #  It opperates correctly when assigned as an attribute
  # ======================================================================

  describe "with a passed block" do
    before(:each) do
      class AttributeTest < ActiveRecord::Base
        self.table_name = 'examples'

        type_cast = Sanitized::DateTime.new(:beginning_of_year) do |date|
          DateTime.new(2001,12,31,23,59,59)  
        end

        attribute :dob, type_cast, default: DateTime.new(2001,2,3,4,5,6)
      end
    end

    after(:each) { Object.send(:remove_const, :AttributeTest) }

    subject { AttributeTest.new }

    it "returns the correct string for a given block" do
      subject.dob = DateTime.new(2001,2,3,4,5,7)
      expect(subject.dob.to_i).to eq DateTime.new(2001,12,31,23,59,59).to_i
    end

    it "acts as expected with a non-string value" do
      expect{subject.dob = BasicObject.new}.to raise_error NoMethodError
    end
  end


  describe "without a passed block" do
    before(:each) do
      class AttributeTest < ActiveRecord::Base
        self.table_name = 'examples'

        type_cast = Sanitized::DateTime.new(:beginning_of_year)

        attribute :dob, type_cast, default: DateTime.new(2001,2,3,4,5,6)
      end
    end

    after(:each) { Object.send(:remove_const, :AttributeTest) }

    subject { AttributeTest.new }

    it "acts as expected with a non-string value" do
      expect{subject.dob = BasicObject.new}.to raise_error NoMethodError
    end
  
    it "doesn't interfere with the standard attribute parameters" do
      expect(subject.dob.to_i).to eq DateTime.new(2001,1,1,0,0,0).to_i
    end
  end


end 
