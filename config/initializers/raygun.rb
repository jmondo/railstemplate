Raygun.setup do |config|
  config.api_key = "SL3vzmL8npBGH3PP/3Xe0g=="
  config.filter_parameters = Rails.application.config.filter_parameters

  # The default is Rails.env.production?
  # config.enable_reporting = !Rails.env.development? && !Rails.env.test?
end
