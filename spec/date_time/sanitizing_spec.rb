# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'

RSpec.describe "DateTime: Sanitizing" do

  #  It modifies the value correctly
  # ======================================================================
  
  describe 'it sanitizes correctly with' do
    let!(:timestamp) { DateTime.new(2001,2,3,4,5,6) }

    it ':at_beginning_of_day' do
      result = Sanitized::DateTime.new(:at_beginning_of_day).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,0,0,0).to_i
    end

    it ':at_beginning_of_hour' do
      result = Sanitized::DateTime.new(:at_beginning_of_hour).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,4,0,0).to_i
    end

    it ':at_beginning_of_minute' do
      result = Sanitized::DateTime.new(:at_beginning_of_minute).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,4,5,0).to_i
    end

    it ':at_beginning_of_month' do
      result = Sanitized::DateTime.new(:at_beginning_of_month).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,1,0,0,0).to_i
    end

    it ':at_beginning_of_week' do
      result = Sanitized::DateTime.new(:at_beginning_of_week).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,1,29,0,0,0).to_i
    end

    it ':at_beginning_of_quarter' do
      result = Sanitized::DateTime.new(:at_beginning_of_quarter).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,1,1,0,0,0).to_i
    end

    it ':at_beginning_of_year' do
      result = Sanitized::DateTime.new(:at_beginning_of_year).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,1,1,0,0,0).to_i
    end



    it ':at_end_of_day' do
      result = Sanitized::DateTime.new(:at_end_of_day).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,23,59,59).to_i
    end

    it ':at_end_of_hour' do
      result = Sanitized::DateTime.new(:at_end_of_hour).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,4,59,59).to_i
    end

    it ':at_end_of_minute' do
      result = Sanitized::DateTime.new(:at_end_of_minute).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,4,5,59).to_i
    end

    it ':at_end_of_month' do
      result = Sanitized::DateTime.new(:at_end_of_month).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,28,23,59,59).to_i
    end

    it ':at_end_of_week' do
      result = Sanitized::DateTime.new(:at_end_of_week).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,4,23,59,59).to_i
    end

    it ':at_end_of_quarter' do
      result = Sanitized::DateTime.new(:at_end_of_quarter).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,3,31,23,59,59).to_i
    end

    it ':at_end_of_year' do
      result = Sanitized::DateTime.new(:at_end_of_year).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,12,31,23,59,59).to_i
    end



   it ':beginning_of_day' do
      result = Sanitized::DateTime.new(:beginning_of_day).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,0,0,0).to_i
    end

    it ':beginning_of_hour' do
      result = Sanitized::DateTime.new(:beginning_of_hour).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,4,0,0).to_i
    end

    it ':beginning_of_minute' do
      result = Sanitized::DateTime.new(:beginning_of_minute).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,4,5,0).to_i
    end

    it ':beginning_of_month' do
      result = Sanitized::DateTime.new(:beginning_of_month).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,1,0,0,0).to_i
    end

    it ':beginning_of_week' do
      result = Sanitized::DateTime.new(:beginning_of_week).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,1,29,0,0,0).to_i
    end

    it ':beginning_of_quarter' do
      result = Sanitized::DateTime.new(:beginning_of_quarter).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,1,1,0,0,0).to_i
    end

    it ':beginning_of_year' do
      result = Sanitized::DateTime.new(:beginning_of_year).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,1,1,0,0,0).to_i
    end



   it ':end_of_day' do
      result = Sanitized::DateTime.new(:end_of_day).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,23,59,59).to_i
    end

    it ':end_of_hour' do
      result = Sanitized::DateTime.new(:end_of_hour).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,4,59,59).to_i
    end

    it ':end_of_minute' do
      result = Sanitized::DateTime.new(:end_of_minute).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,4,5,59).to_i
    end

    it ':end_of_month' do
      result = Sanitized::DateTime.new(:end_of_month).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,28,23,59,59).to_i
    end

    it ':end_of_week' do
      result = Sanitized::DateTime.new(:end_of_week).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,4,23,59,59).to_i
    end

    it ':end_of_quarter' do
      result = Sanitized::DateTime.new(:end_of_quarter).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,3,31,23,59,59).to_i
    end

    it ':end_of_year' do
      result = Sanitized::DateTime.new(:end_of_year).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,12,31,23,59,59).to_i
    end




    it ':at_midday' do
      result = Sanitized::DateTime.new(:at_midday).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,12,0,0).to_i
    end

    it ':at_middle_of_day' do
      result = Sanitized::DateTime.new(:at_middle_of_day).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,12,0,0).to_i
    end

    it ':at_midnight' do
      result = Sanitized::DateTime.new(:at_midnight).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,0,0,0).to_i
    end

    it ':at_noon' do
      result = Sanitized::DateTime.new(:at_noon).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,12,0,0).to_i
    end




    it ':midday' do
      result = Sanitized::DateTime.new(:midday).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,12,0,0).to_i
    end

    it ':middle_of_day' do
      result = Sanitized::DateTime.new(:middle_of_day).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,12,0,0).to_i
    end

    it ':midnight' do
      result = Sanitized::DateTime.new(:midnight).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,0,0,0).to_i
    end

    it ':noon' do
      result = Sanitized::DateTime.new(:noon).cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,3,12,0,0).to_i
    end




    it "a custom block being given" do
      sdt =  Sanitized::DateTime.new() { |date| date + 24.hours }
      result = sdt.cast(timestamp)
      expect(result.to_i).to eq DateTime.new(2001,2,4,4,5,6).to_i
    end
  end # 'it correctly sanitizes the value on'
end 
