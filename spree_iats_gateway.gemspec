# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spree_iats_gateway/version"

Gem::Specification.new do |s|
  s.name        = "spree_iats_gateway"
  s.version     = SpreeIatsGateway::Version
  s.authors     = ["Tyler Rick"]
  s.email       = ["tyler@k3integrations.com"]
  s.homepage    = ""
  s.summary     = %q{Spree extension for IATS payment gateway}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
