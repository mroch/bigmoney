# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{big_money}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marshall Roch"]
  s.date = %q{2009-02-26}
  s.description = %q{Represents an amount of money in a particular currency. Backed by BigDecimal,  so is safe from float rounding errors.}
  s.email = ["mroch@cmu.edu"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.txt", "Rakefile", "big_money.gemspec", "lib/big_money.rb", "lib/big_money/big_money.rb", "lib/big_money/core_extensions.rb", "lib/big_money/currency.rb", "lib/big_money/currency/iso4217.rb", "lib/big_money/exchange.rb", "lib/big_money/exchange/yahoo.rb", "rakelib/cultivate.rake", "rakelib/iso4217.rake", "rakelib/iso4217.rb", "rakelib/iso4217.rb.erb", "test/test_big_money.rb", "test/test_currency.rb", "test/test_exchange.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{big_money}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Represents an amount of money in a particular currency}
  s.test_files = ["test/test_big_money.rb", "test/test_currency.rb", "test/test_exchange.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.3"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.3"])
  end
end
