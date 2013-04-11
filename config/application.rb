# Put this in config/application.rb
require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module Prudge
  class Application < Rails::Application
    config.autoload_paths += [config.root.join('lib')]
    config.encoding = 'utf-8'
    # Settings in config/environments/* take precedence those specified here

    config.filter_parameters += [:password, :password_confirmation]
  
    # Skip frameworks you're not going to use (only works if using vendor/rails)
    # config.frameworks -= [ :action_web_service, :action_mailer ]

    config.cache_store = :mem_cache_store, '127.0.0.1:11211', { :namespace => 'prudge' }

    config.session_store :cache_store, :key => '_prudge_session'
  
    config.action_controller.session_store = :mem_cache_store
  
    # Make Active Record use UTC-base instead of local time
    # config.active_record.default_timezone = :utc
  
    config.action_controller.session = {
      :key => '_coder_session',
      :secret => '4dfcafege5e3f536df7a3fa4db76f5a8070d9d508864b876cabe7d79a773f5bf11088849b897a8c98a38c6ce6he9f92ba79b386dadd2be5e1efefe8f83f4c7m'
    }
  
    config.autoload_paths << Rails.root.join('app','observers')
    config.active_record.observers = [:solution_observer, :problem_observer, :contest_observer, :comment_observer]
  
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names.
    config.time_zone = 'Ulaan Bataar'
  
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    config.i18n.default_locale = :mn
  end
end
