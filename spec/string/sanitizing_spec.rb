# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'

RSpec.describe "String: Sanitizing" do

  #  It modifies the value correctly
  # ======================================================================
  
  describe 'it sanitizes correctly with' do
    it ':capitalize' do
      expect(Sanitized::String.new(:capitalize).cast('msg')).to eq 'Msg'
    end

    it ':camelize' do
      expect(Sanitized::String.new(:camelize).cast('mess_age')).to eq 'MessAge'
    end

    it ':camelcase' do
      expect(Sanitized::String.new(:camelcase).cast('me_ss/age')).to eq 'MeSs::Age'
    end

    it ':chomp' do
      expect(Sanitized::String.new(:chomp).cast("msg\r\n")).to eq "msg"
    end

    it ':dasherize' do
      expect(Sanitized::String.new(:dasherize).cast('me_ssa_ge')).to eq 'me-ssa-ge'
    end

    it ':downcase' do
      expect(Sanitized::String.new(:downcase).cast('ME-SSA-GE')).to eq 'me-ssa-ge'
    end

    it ':humanize' do
      expect(Sanitized::String.new(:humanize).cast('mess_age_id')).to eq 'Mess age'
    end

    it ':lstrip' do
      expect(Sanitized::String.new(:lstrip).cast('  msg  ')).to eq 'msg  '
    end

    it ':parameterize' do
      expect(Sanitized::String.new(:parameterize).cast('Mess Age')).to eq 'mess-age'
    end

    it ':rstrip' do
      expect(Sanitized::String.new(:rstrip).cast('  msg  ')).to eq '  msg'
    end

    it ':singularize' do
      expect(Sanitized::String.new(:singularize).cast('Messages')).to eq 'Message'
    end

    if ActiveModel.gem_version > Gem::Version.new('5.1.0.beta1')
      it ':squish' do
        expect(Sanitized::String.new(:squish).cast("  me  ss   age  \r\n")).to eq 'me ss age'
      end
    end

    it ':strip' do
      expect(Sanitized::String.new(:strip).cast("  msg  \n")).to eq "msg"
    end

    it ':swapcase' do
      expect(Sanitized::String.new(:swapcase).cast('mSg')).to eq 'MsG'
    end

    it ':titlecase' do
      expect(Sanitized::String.new(:titlecase).cast('mes sag e')).to eq 'Mes Sag E'
    end

    it ':titleize' do
      expect(Sanitized::String.new(:titleize).cast('mes sag e')).to eq 'Mes Sag E'
    end

    it ':underscore' do
      expect(Sanitized::String.new(:underscore).cast('mess-age')).to eq 'mess_age'
    end

    it ':upcase' do
      expect(Sanitized::String.new(:upcase).cast('msg')).to eq 'MSG'
    end

    it ':upcase_first' do
      expect(Sanitized::String.new(:upcase_first).cast('msg')).to eq 'Msg'
    end

    it "a custom block being given" do
      cs = Sanitized::String.new(:camelize) { |value| value + '-woohoo' }
      expect(cs.cast('msg')).to eq 'Msg-woohoo'
    end
  end # 'it correctly sanitizes the value on'
end 
