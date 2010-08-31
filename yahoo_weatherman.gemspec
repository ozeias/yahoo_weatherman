Gem::Specification.new do |gem|
  gem.name = "yahoo_weatherman"
  gem.version = "1.1.1"
  gem.authors = ["Dalto Curvelano Junior", "Leandro de Oliveira", "Ozéias Sant'ana"]
  gem.description = "A ruby wrapper to the Yahoo! Weather feed with i18n support."
  gem.summary = "A ruby wrapper to the Yahoo! Weather feed with i18n support."
  gem.files = [
    "yahoo_weatherman.gemspec",
    "lib/yahoo_weatherman/image.rb",
    "lib/yahoo_weatherman/response.rb",
    "lib/yahoo_weatherman/i18n.rb",
    "lib/yahoo_weatherman.rb",
    "i18n/pt-br.yml",
    "spec/files/belo_horizonte_c.rss",
    "spec/files/belo_horizonte_f.rss",
    "spec/spec_helper.rb",
    "spec/yahoo_weatherman/response_spec.rb",
    "spec/yahoo_weatherman/yahoo_weatherman_spec.rb",
    "spec/yahoo_weatherman/i18n_spec.rb"
  ]
  gem.homepage = "http://github.com/dlt/yahoo_weatherman"
end