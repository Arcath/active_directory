# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'adtools/version'

Gem::Specification.new do |s|
    s.name = "adtools"
    s.version = Adtools::Version
    s.platform = Gem::Platform::RUBY
    s.authors = ["Adam \"Arcath\" Laycock"]
    s.email = ["gems@arcath.net"]
    s.homepage = "http://adtools.arcath.net"
    s.summary = "Ruby bindings for Microsofts Active Directory (LDAP), a fork of ActiveDirectory"
    
    s.add_development_dependency "rspec"
    s.add_dependency "net-ldap"
    
    s.files         = `git ls-files`.split("\n")
    s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")   
    s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_paths = ["lib"]
end