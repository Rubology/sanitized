# frozen_string_literal: true

require './ruby_version'



# ActiveRecord 8.0
if RubyVersion >= 3.2
  appraise 'active-record-8-0-1' do
    gem 'sqlite3', '~> 2.1'
    gem 'activerecord', '8.0.1'
    gem 'database_cleaner-active_record'
    gem 'simplecov'
  end
end


# ActiveRecord 7.2
if RubyVersion >= 3.1
  appraise 'active-record-7-2-2-1' do
    gem 'sqlite3', '~> 2.1'
    gem 'activerecord', '7.2.2.1'
    gem 'database_cleaner-active_record'
    gem 'simplecov'
  end
end


# ActiveRecord 7.1
if RubyVersion >= 2.7
  appraise 'active-record-7-1-5-1' do
    gem 'sqlite3', '~> 1.4'
    gem 'activerecord', '7.1.5.1'
    gem 'database_cleaner-active_record'
  end
end


# ActiveRecord 7.0
if RubyVersion >= 2.7
  appraise 'active-record-7-0-8-7-a' do
    gem 'sqlite3', '~> 1.4'
    gem 'activerecord', '7.0.8.7'
    gem 'database_cleaner-active_record'

    if RubyVersion >= 3.4
      gem 'bigdecimal'
      gem 'mutex_m'
    end
  end
end

# ActiveRecord 6.1
if RubyVersion >= 2.5
  appraise 'active-record-6-1-7-10' do
    gem 'minitest', '5.15.0'
    gem 'sqlite3', '~> 1.4'
    gem 'activerecord', '6.1.7.10'
    gem 'database_cleaner-active_record'

    if RubyVersion >= 3.4
      gem 'base64'
      gem 'bigdecimal'
      gem 'mutex_m'
    end
  end
end


# ActiveRecord 6.0
if RubyVersion >= 2.5 and RubyVersion < 3.0
  appraise 'active-record-6-0-6-1' do
    gem 'minitest', '5.15.0'
    gem 'sqlite3', '~> 1.4'
    gem 'activerecord', '6.0.6.1'
    gem 'database_cleaner-active_record'
  end
end


# ActiveRecord 5.2
if RubyVersion >= 2.5 and RubyVersion < 3.0
  appraise 'active-record-5-2-8-1' do
    gem 'minitest', '5.15.0'
    gem 'sqlite3', '~> 1.3.6'
    gem 'activerecord', '5.2.8.1'
    gem 'database_cleaner-active_record'
  end
end


# ActiveRecord 5.1
if RubyVersion >= 2.5 and RubyVersion < 3.0
  appraise 'active-record-5-1-7' do
    gem 'minitest', '5.15.0'
    gem 'sqlite3', '~> 1.3.6'
    gem 'activerecord', '5.1.7'
    gem 'database_cleaner-active_record'
  end
end


# ActiveRecord 5.0
if RubyVersion >= 2.5 and RubyVersion < 3.0
  appraise 'active-record-5-0-7-2' do
    gem 'minitest', '5.15.0'
    gem 'sqlite3', '1.3.13'
    gem 'activerecord', '5.0.7.2'
    gem 'database_cleaner', '~> 1.8.0'
  end
end
