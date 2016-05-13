require File.expand_path('../boot', __FILE__)
require "rails/all"
require "ccsv"

Bundler.require(*Rails.groups)
module Nestegg
  class Application < Rails::Application
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = 'en-GB'
    config.i18n.fallbacks = [:en]
    config.time_zone = 'London'
    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end
    config.action_controller.action_on_unpermitted_parameters = :raise
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :resque
  end
end
