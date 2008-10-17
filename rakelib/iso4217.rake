namespace :currency do

  desc 'Create ISO 4217 currency classes from wikipedia ISO 4217 table.'
  task :iso4217 do
    dirname = File.dirname(__FILE__)
    gen     = File.join(dirname, %w{iso4217.rb})
    lib     = File.expand_path(File.join(dirname, %w{.. lib big_money currency iso4217.rb}))
    require gen
    modules = BigMoney::Task::ISO4217.get
    File.open(lib, File::CREAT | File::TRUNC | File::WRONLY) do |f|
      f.write modules
    end
  end

end # :currency

