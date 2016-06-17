# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'common_math/version'

Gem::Specification.new do |s|
  s.name          = 'ruby_ext_in_crystal_math'
  s.version       = CommonMath::VERSION
  s.authors       = ['Anna Kazakova (gaar4ica)']
  s.email         = ['gaar4ica@gmail.com']
  s.description   = 'Using crystal extensions for ruby via gem'
  s.summary       = 'Proof of concept. Using crystal extensions for ruby via gem'
  s.license       = 'MIT'

  s.extensions    = %w[ext/common_math/extconf.rb]
end
