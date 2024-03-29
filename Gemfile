################################################################################
# Generic Gemfile
# Updated according to:
#   - Michael Hartl 3-rd Edition (Listing 11.67)
#   - BKC standards (?)
#   - Heroku
#
#   28.06.2015  ZT
#   . . .
#   23.03.2022  Ruby 3.1.1 / Rails 7.0.2.3
#   19.04.2022  Ruby 3.1.2
#   20.05.2022	Rails 7.0.3
#   10.11.2022  Rails 7.0.4
#   07.01.2023  Ruby 3.2.0: File depricated methods removed
#   27.01.2023  Rails 7.0.4.2
#   22.03.2023  Ruby 3.2.1, Rails 7.0.4.3
#   30.03.2023  Psych workaround (v. < 4)
#   
#     rails new app --css bootstrap
#
#     ESBuild, Bootstrap, Simple Form, enum_helper, solargraph, etc.
#     No gems: haml-rails, importmap-rails, bootstrap, sassc-rails
################################################################################
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"
gem "rails", "~> 7.0.4" # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'psych', '< 4'

gem "sprockets-rails"   # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "puma"              # Use the Puma web server [https://github.com/puma/puma]
gem "jsbundling-rails"  # Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "cssbundling-rails" # Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "turbo-rails"       # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "stimulus-rails"    # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "jbuilder"          # Build JSON APIs with ease [https://github.com/rails/jbuilder]

# gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production
# gem "kredis"          # Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]

gem "bcrypt"            # Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "bootsnap",    require: false  # Reduces boot times through caching; required in config/boot.rb
gem "image_processing"  # Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]

############ ZT ############
gem 'pg'                # Use postgresql as the database for Active Record
gem 'pg_search'         # https://mkdev.me/posts/kak-delat-full-text-poisk-v-rails-pri-pomoschi-postgresql
gem 'seed_dump'         # https://github.com/rroblak/seed_dump
gem 'seedbank'          # http://github.com/james2m/seedbank

gem 'simple_form'       # https://github.com/plataformatec/simple_form
gem 'enum_help'         # MUST BE for simple form
gem 'translate_enum'
# gem 'haml-rails'      # https://github.com/indirect/haml-rails
gem 'pundit'            # https://github.com/elabs/pundit
gem 'countries'

gem 'rack-cors'
gem 'devise'                       # https://github.com/plataformatec/devise
gem 'devise_token_auth', github:  'lynndylanhurley/devise_token_auth'
########################################
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]   # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
end
 
# gem "rack-mini-profiler"  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
# gem "spring"             # Speed up commands on slow machines / big apps [https://github.com/rails/spring]

  group :development do
    gem 'solargraph'
    gem 'foreman'
    gem 'web-console'        # Access an IRB console on exception pages or by using <%= console %> in views
    gem 'awesome_print'
    
  # gem "rack-mini-profiler"  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "spring"             # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem 'webdrivers'        # replaced chromedriver-helper after 2019-03-31

  gem 'shoulda'
  # gem 'minitest-reporters'
  # gem 'mini_backtrace'
  # gem 'guard'
  # gem 'guard-minitest'
end

# Heroku
# group :production do
#   gem 'rails_12factor'
# end

# gem 'unicorn'                                 # Use Unicorn as the app server
# gem 'capistrano-rails', group: :development   # Use Capistrano for deployment
