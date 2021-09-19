# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'

RSpec.describe "DateTime: Exclusive Options" do

  describe "options have the correct exclusivity for:" do

    Sanitized::DateTime.valid_options.keys.each do |opt|
      it ":#{opt}" do
        if Sanitized::DateTime.valid_options[opt].present?
          Sanitized::DateTime.valid_options[opt].each do |exclusive_opt|
            expect(Sanitized::DateTime.valid_options[exclusive_opt]).to include(opt)
          end
        else
          expect(Sanitized::DateTime.valid_options[opt]).to be_blank
        end
      end
    end # each |opt|
  end
end 
