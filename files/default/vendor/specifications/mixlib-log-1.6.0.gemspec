# stub: mixlib-log 1.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mixlib-log"
  s.version = "1.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Opscode, Inc."]
  s.email = "info@opscode.com"
  s.extra_rdoc_files = ["README.rdoc", "LICENSE", "NOTICE"]
  s.files = ["LICENSE", "NOTICE", "README.rdoc"]
  s.homepage = "http://www.opscode.com"
  s.rubygems_version = "2.4.5.1"
  s.summary = "A gem that provides a simple mixin for log functionality"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new("1.2.0")
      s.add_development_dependency("rake", [">= 0"])
      s.add_development_dependency("rspec", ["~> 2.10"])
      s.add_development_dependency("cucumber", [">= 0"])
    else
      s.add_dependency("rake", [">= 0"])
      s.add_dependency("rspec", ["~> 2.10"])
      s.add_dependency("cucumber", [">= 0"])
    end
  else
    s.add_dependency("rake", [">= 0"])
    s.add_dependency("rspec", ["~> 2.10"])
    s.add_dependency("cucumber", [">= 0"])
  end
end
