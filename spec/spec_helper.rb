# frozen_string_literal: true

# ======================================================================
# = Includes
# ======================================================================

require './ruby_version'
require 'rspec/expectations'
require 'active_record'
require 'byebug'
require 'amazing_print'

if ActiveRecord.version.to_s.start_with?('5.0')
  require 'database_cleaner'
else
  require 'database_cleaner-active_record'
end

# Only calculate coverage when latest version of ruby and ActiveRecord
if ENV['WITH_COVERAGE']
  puts "\nCoverage requested."
  begin
    require 'simplecov'

    SimpleCov.configure do
      # exclude tests
      add_filter 'spec'
    end

    # if ENV['FAIL_ON_MINIMUM']
    #   SimpleCov.minimum_coverage 100
    # end

    # start it up
    SimpleCov.start

  rescue LoadError
    puts "\n *** Coverage required, but SimpleCov gem not available! ***"

  ensure
    # clear the WITH_COVERAGE environmental variable
    ENV.delete 'WITH_COVERAGE'
  end
end


# require AFTER simpleCov has started to ensure inclusion in metrics
require_relative '../lib/sanitized'



# ======================================================================
#  Report the Version
# ======================================================================

current_ruby = Gem::Version.new(RUBY_VERSION)
msg          = "ActiveRecord-#{ActiveRecord.gem_version} | Ruby-#{current_ruby}"

puts "\n\n"
puts '=' * (msg.size + 4)
puts "\n  #{msg}\n\n"
puts '=' * (msg.size + 4)
puts "\n\n"



# ======================================================================
#  Hide Deprecation Warnings
# ======================================================================

# silence all warnings when bulk testing with 'rake all'
if ENV['HIDE_DEPRECATIONS']
  ActiveRecord::Migration.verbose = false

  if ActiveRecord.gem_version >= Gem::Version.new("7.1")
    ActiveRecord.deprecator.behavior = :silence
  else
    ActiveSupport::Deprecation.behavior = :silence
  end
end



# ======================================================================
#  Initialise the DB and ActiveRecord
# ======================================================================

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: ':memory:'
)



# Example table migration
# table for testing class definitions
ar_version = ActiveRecord::VERSION::MAJOR + (ActiveRecord::VERSION::MINOR / 10.0)
class CreateExampleTable < ActiveRecord::Migration[ar_version]

  def up
    create_table :examples do |t|
      t.string    :name
      t.bigint    :age
      t.datetime  :dob
    end
  end

end

# Create the tables
CreateExampleTable.migrate(:up)



# ======================================================================
# = Configure RSpec
# ======================================================================

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end


  config.shared_context_metadata_behavior = :apply_to_host_groups


  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
