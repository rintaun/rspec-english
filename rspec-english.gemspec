Gem::Specification.new do |s|
    s.name             = 'rspec-english'
    s.version          = '0.0.1'
    s.date             = '2013-04-17'
    s.platform         = Gem::Platform::RUBY
    s.license          = 'MIT'
    s.authors          = ['Matthew Lanigan']
    s.email            = 'rintaun@gmail.com'
    s.homepage         = 'https://github.com/rintaun/rspec-english'
    s.summary          = 'Better English for RSpec descriptions'
    s.description      = <<-desc
        Modifies RSpec's description generator to produce more
        natural-sounding English.
    desc
    s.files            = ['lib/rspec-english.rb', 'LICENSE']
    s.extra_rdoc_files = ['README.md']
    s.rdoc_options     = ['--charset=UTF-8']
    s.add_runtime_dependency 'rspec-core', '~> 2.13.1'
end
