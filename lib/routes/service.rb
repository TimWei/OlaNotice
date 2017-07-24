class ErrMonitor < Sinatra::Base
  namespace '/api' do
    get '/services/:service_id' do
      result = {}
      Service.where(id: params[:service_id]).live.includes(:messages).each do |service|
        service_hash = result[service.id] = {}
        service_hash['name'] = service.name
        service_hash['access_token'] = service.access_token
        service_hash['created_at'] = service.created_at
        service_hash['messages'] = service.messages_hash
      end
      result.to_json
    end
  end
end