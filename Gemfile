source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.2.2"

# The traditional bundling and transpiling asset pipeline for Rails.
gem "sprockets-rails", ">= 2.0.0"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.6.4"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails", "~> 1.0.3"

# Easy React view integration
gem "react-rails", "~> 2.6.1"

# Upgrade partials to allow for defining slots
gem "nice_partials"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails", ">= 1.1.1"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails", ">= 1.1.2"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", ">= 1.1.1"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", ">= 1.0.4"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.11.5"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.12.0", require: false

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # Start debugger with binding.b [https://github.com/ruby/debug]
  gem "debug", ">= 1.5.0", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", ">= 4.2.0"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler", ">= 2.3.3"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", ">= 3.37.1"
  gem "selenium-webdriver", ">= 4.1.0"
  gem "webdrivers", "5.0.0"
  gem 'rexml', '~> 3.2.5'
end

gem 'devise'
gem "passwordless", "~> 0.10.0"
gem "rolify"

gem "pg", "~> 1.4.1"
