module LogrageConcern
  extend ActiveSupport::Concern

  def append_info_to_payload(payload)
    super
    payload[:remote_ip] = request.remote_ip
    payload[:headers] = request.headers.to_h
    payload[:request_id] = request.request_id
  end
end
