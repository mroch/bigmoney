Gem::Specification.new do |s|
  s.name = %q{BigMoney}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marshall Roch"]
  s.date = %q{2008-10-20}
  s.description = %q{Represents an amount of money in a particular currency. Backed by BigDecimal,  so is safe from float rounding errors.}
  s.email = ["mroch@cmu.edu"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.txt", "Rakefile", "bigmoney.gemspec", "lib/big_money.rb", "lib/big_money/big_money.rb", "lib/big_money/core_extensions.rb", "lib/big_money/currency.rb", "lib/big_money/currency/iso4217.rb", "lib/big_money/exchange.rb", "lib/big_money/exchange/yahoo.rb", "rakelib/cultivate.rake", "rakelib/iso4217.rake", "rakelib/iso4217.rb", "rakelib/iso4217.rb.erb", "test/test_big_money.rb", "test/test_currency.rb", "test/test_exchange.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{bigmoney}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Represents an amount of money in a particular currency}
  s.test_files = ["test/test_big_money.rb", "test/test_currency.rb", "test/test_exchange.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
