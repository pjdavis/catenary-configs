Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.base_controller_class = 'ActionController::API'
  config.lograge.formatter = Lograge::Formatters::Json.new
  config.colorize_logging = false

  config.lograge.custom_options = lambda do |event|
    {
      params: event.payload[:params].except('controller', 'action', 'format'),
      request_id: event.payload[:request_id],
      remote_ip: event.payload[:remote_ip],
      query_string: event.payload[:headers]['QUERY_STRING'],
      http_host: event.payload[:headers]['HTTP_HOST'],
      user_agent: event.payload[:headers]['HTTP_USER_AGENT']
    }
  end
end
