# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'


RSpec.describe "Float: Setter Methods" do

  #   With stated transitions
  # ======================================================================

  before(:all) do
    class AttributeTest < ActiveRecord::Base
      self.table_name = 'examples'
      attribute :age, Sanitized::Float.new(:abs)
    end
  end

  after(:all) { Object.send(:remove_const, :AttributeTest) }

  subject { AttributeTest.new }


  describe "it works successfullt with setter method" do
    it ":=" do
      subject.age = -123
      expect(subject.age).to eq 123
    end

    it ":attributes=" do
      subject.attributes = {age: -123}
      expect(subject.age).to eq 123
    end

    it ":assign_attributes" do
      subject.assign_attributes age: -123
      expect(subject.age).to eq 123
    end

    it ":write_attribute" do
      subject.write_attribute :age, -123
      expect(subject.age).to eq 123
    end

    it ":[]=" do
      subject[:age] = -123
      expect(subject.age).to eq 123
    end

    it ":update" do
      subject.update age: -123
      expect(subject.age).to eq 123
    end

    it ":update_attribute" do
      subject.update_attribute :age, -123
      expect(subject.age).to eq 123
    end

    # :update_attributes was removed in version 6.1.0.rc1
    if ActiveRecord.gem_version < Gem::Version.new('6.1.0.rc1')
      it ":update_attribute" do
        subject.update_attributes age: -123
        expect(subject.age).to eq 123
      end
    end

    it ":update_column" do
      subject.save
      subject.update_column :age, -123
      expect(subject.age).to eq 123
    end

    it ":update_columns" do
      subject.save
      subject.update_columns age: -123
      expect(subject.age).to eq 123
    end

    it "Class.new" do
      test = AttributeTest.new(age: -123)
      expect(test.age).to eq 123
    end

    it "Class.create" do
      test = AttributeTest.create(age: -123)
      expect(test.reload.age).to eq 123
    end

    it "Class.update" do
      subject.save
      AttributeTest.update(subject.id, age: -123)
      expect(subject.reload.age).to eq 123
    end
  end # "it works successfullt with setter method"
end
