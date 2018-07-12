source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'puma', '~> 3.11'

gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sidekiq-history'
gem 'sidekiq-unique-jobs'

gem 'dotenv-rails'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'httpclient'

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end