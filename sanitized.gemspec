# frozen_string_literal: true

require_relative 'version'

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY

  spec.name        = 'sanitized'
  spec.version     = Sanitized.gem_version
  spec.summary     = %( An elegant solution for sanitizing user input, with a number of 
                        built-in options or your own custom code. )

  spec.description = %(
    An elegant solution for sanitizing user input. Cleaning & reformatting user data 
    is a necessary chore for all developers; but it no longer needs to be time-consuming!
    The Sanitized suite of helpers allow you to quickly sanitize any ActiveRecord
    attribute, and easily add your own custom code to catch those edge cases. 
    It will save you a surprisingly large amount of time!
  ).gsub("\n", ' ')

  spec.author   = 'CodeMeister'
  spec.email    = 'sanitized@codemeister.dev'
  spec.homepage = 'https://github.com/Rubology/sanitized'
  spec.license  = 'MIT'

  spec.files         = Dir.glob('lib/**/*', File::FNM_DOTMATCH)
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri']   = 'https://github.com/Rubology/sanitized/blob/master/CHANGELOG.md'

  spec.add_runtime_dependency 'activerecord', '>= 5.0.0.beta1'
end # Gem::Specification.new
