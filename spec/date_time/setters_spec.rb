# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'


RSpec.describe "DateTime: Setter Methods" do

  #   With stated transitions
  # ======================================================================

  before(:all) do
    class AttributeTest < ActiveRecord::Base
      self.table_name = 'examples'
      attribute :dob, Sanitized::DateTime.new(:beginning_of_year)
    end
  end

  after(:all) { Object.send(:remove_const, :AttributeTest) }

  subject { AttributeTest.new }

  let!(:dob) { DateTime.new(2001,2,3,4,5,6) }
  let!(:expected) { DateTime.new(2001,1,1,0,0,0) }


  describe "it works successfullt with setter method" do
    it ":=" do
      subject.dob = dob
      expect(subject.dob.to_i).to eq expected.to_i
    end

    it ":attributes=" do
      subject.attributes = {dob: dob}
      expect(subject.dob.to_i).to eq expected.to_i
    end

    it ":assign_attributes" do
      subject.assign_attributes dob: dob
      expect(subject.dob.to_i).to eq expected.to_i
    end

    it ":write_attribute" do
      subject.write_attribute :dob, dob
      expect(subject.dob.to_i).to eq expected.to_i
    end

    it ":[]=" do
      subject[:dob] = dob
      expect(subject.dob.to_i).to eq expected.to_i
    end

    it ":update" do
      subject.update dob: dob
      expect(subject.dob.to_i).to eq expected.to_i
    end

    it ":update_attribute" do
      subject.update_attribute :dob, dob
      expect(subject.dob.to_i).to eq expected.to_i
    end

    # :update_attributes was removed in version 6.1.0.rc1
    if ActiveRecord.gem_version < Gem::Version.new('6.1.0.rc1')
      it ":update_attribute" do
        subject.update_attributes dob: dob
        expect(subject.dob.to_i).to eq expected.to_i
      end
    end

    it ":update_column" do
      subject.save
      subject.update_column :dob, dob
      expect(subject.dob.to_i).to eq expected.to_i
    end

    it ":update_columns" do
      subject.save
      subject.update_columns dob: dob
      expect(subject.dob.to_i).to eq expected.to_i
    end

    it "Class.new" do
      test = AttributeTest.new(dob: dob)
      expect(test.dob.to_i).to eq expected.to_i
    end

    it "Class.create" do
      test = AttributeTest.create(dob: dob)
      expect(test.reload.dob.to_i).to eq expected.to_i
    end

    it "Class.update" do
      subject.save
      AttributeTest.update(subject.id, dob: dob)
      expect(subject.reload.dob.to_i).to eq expected.to_i
    end
  end # "it works successfullt with setter method"
end
