# ==================================================================================
# =  Tag an individual test with `:test` then run with `rspec spec --tag test`
# ==================================================================================

require 'spec_helper'

RSpec.describe "String: Exclusive Options" do

  describe "options have the correct exclusivity for:" do

    Sanitized::String._valid_options.keys.each do |opt|
      it ":#{opt}" do
        if Sanitized::String._valid_options[opt].present?
          Sanitized::String._valid_options[opt].each do |exclusive_opt|
            expect(Sanitized::String._valid_options[exclusive_opt]).to include(opt)
          end
        else
          expect(Sanitized::String._valid_options[opt]).to be_blank
        end
      end
    end # each |opt|
  end
end 
