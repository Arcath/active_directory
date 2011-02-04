# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{activedirectory}
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James R Hunt"]
  s.date = %q{2011-02-04}
  s.description = %q{ActiveDirectory uses Net::LDAP to provide a means of accessing and modifying an Active Directory data store.}
  s.email = %q{filefrog@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "lib/active_directory.rb",
    "lib/active_directory/base.rb",
    "lib/active_directory/computer.rb",
    "lib/active_directory/container.rb",
    "lib/active_directory/group.rb",
    "lib/active_directory/member.rb",
    "lib/active_directory/password.rb",
    "lib/active_directory/rails/synchronizer.rb",
    "lib/active_directory/rails/user.rb",
    "lib/active_directory/timestamp.rb",
    "lib/active_directory/user.rb"
  ]
  s.homepage = %q{http://github.com/filefrog/activedirectory}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{An interface library for accessing Microsoft's Active Directory.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<net-ldap>, [">= 0.1.1"])
    else
      s.add_dependency(%q<net-ldap>, [">= 0.1.1"])
    end
  else
    s.add_dependency(%q<net-ldap>, [">= 0.1.1"])
  end
end
