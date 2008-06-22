Gem::Specification.new do |s|
  s.name = "BigMoney"
  s.version = "0.1.0"
  s.date = "2008-06-21"
  s.summary = "Represents an amount of money in a particular currency."
  s.email = "mroch@cmu.edu"
  s.homepage = "http://github.com/mroch/bigmoney"
  s.description = "Represents an amount of money in a particular currency. Backed by BigDecimal, so is safe from float rounding errors."
  s.has_rdoc = false
  s.authors = ["Marshall Roch"]
  s.files = [
    "bigmoney.gemspec",
    "History.txt",
    "Manifest.txt",
    "LICENSE.txt",
    "Rakefile",
    "README.txt",
    "lib/big_money.rb",
    "lib/big_money/big_money.rb",
    "lib/big_money/core_extensions.rb",
    "test/test_big_money.rb"
  ]
  s.test_files = ["test/test_big_money.rb"]
  # s.rdoc_options = ["--main", "README.txt"]
  # s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  # s.add_dependency("mime-types", ["> 0.0.0"])
end