# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'


RSpec.describe "String: Setter Methods" do

  #   With stated transitions
  # ======================================================================

  before(:all) do
    class AttributeTest < ActiveRecord::Base
      self.table_name = 'examples'
      attribute :name, Sanitized::String.new(:squish, :upcase)
    end
  end

  after(:all) { Object.send(:remove_const, :AttributeTest) }

  subject { AttributeTest.new }


  describe "it works successfully with setter method" do
    it ":=" do
      subject.name = ' tester '
      expect(subject.name).to eq 'TESTER'
    end

    it ":attributes=" do
      subject.attributes = {name: ' tester '}
      expect(subject.name).to eq 'TESTER'
    end

    it ":assign_attributes" do
      subject.assign_attributes name: ' tester '
      expect(subject.name).to eq 'TESTER'
    end

    it ":write_attribute" do
      subject.write_attribute :name, ' tester '
      expect(subject.name).to eq 'TESTER'
    end

    it ":[]=" do
      subject[:name] = ' tester '
      expect(subject.name).to eq 'TESTER'
    end

    it ":update" do
      subject.update name: ' tester '
      expect(subject.name).to eq 'TESTER'
    end

    it ":update_attribute" do
      subject.update_attribute :name, ' tester '
      expect(subject.name).to eq 'TESTER'
    end

    # :update_attributes was removed in version 6.1.0.rc1
    if ActiveRecord.gem_version < Gem::Version.new('6.1.0.rc1')
      it ":update_attribute" do
        subject.update_attributes name: ' tester '
        expect(subject.name).to eq 'TESTER'
      end
    end

    it ":update_column" do
      subject.save
      subject.update_column :name, ' tester '
      expect(subject.name).to eq 'TESTER'
    end

    it ":update_columns" do
      subject.save
      subject.update_columns name: ' tester '
      expect(subject.name).to eq 'TESTER'
    end

    it "Class.new" do
      test = AttributeTest.new(name: ' tester ')
      expect(test.name).to eq 'TESTER'
    end

    it "Class.create" do
      test = AttributeTest.create(name: ' tester ')
      expect(test.reload.name).to eq 'TESTER'
    end

    it "Class.update" do
      subject.save
      AttributeTest.update(subject.id, name: ' tester ')
      expect(subject.reload.name).to eq 'TESTER'
    end
  end # "it works successfullt with setter method"
end
