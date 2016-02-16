Airbrake.configure do |config|
  config.environment = Rails.env
  config.project_key = ENV.fetch("AIRBRAKE_PROJECT_KEY")
  config.project_id = ENV.fetch("AIRBRAKE_PROJECT_ID")
  config.ignore_environments = %w(development test)
end
