# stub: etcd 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "etcd"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ranjib Dey"]
  s.description = "Ruby client library for etcd"
  s.email = ["ranjib@pagerduty.com"]
  s.homepage = "https://github.com/ranjib/etcd-ruby"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9")
  s.rubygems_version = "2.4.5.1"
  s.summary = "Ruby client library for etcd"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new("1.2.0")
      s.add_runtime_dependency("mixlib-log", [">= 0"])
      s.add_development_dependency("uuid", [">= 0"])
      s.add_development_dependency("bundler", [">= 0"])
      s.add_development_dependency("rake", [">= 0"])
      s.add_development_dependency("rdoc", [">= 0"])
      s.add_development_dependency("rspec", [">= 0"])
    else
      s.add_dependency("mixlib-log", [">= 0"])
      s.add_dependency("uuid", [">= 0"])
      s.add_dependency("bundler", [">= 0"])
      s.add_dependency("rake", [">= 0"])
      s.add_dependency("rdoc", [">= 0"])
      s.add_dependency("rspec", [">= 0"])
    end
  else
    s.add_dependency("mixlib-log", [">= 0"])
    s.add_dependency("uuid", [">= 0"])
    s.add_dependency("bundler", [">= 0"])
    s.add_dependency("rake", [">= 0"])
    s.add_dependency("rdoc", [">= 0"])
    s.add_dependency("rspec", [">= 0"])
  end
end
