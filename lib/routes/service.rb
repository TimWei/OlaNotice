class ErrMonitor < Sinatra::Base
  namespace '/api' do
    namespace '/services/:service_id' do
      before { 
        @service = Service.where(id: params[:service_id]).live.includes(:messages).first
        raise 'Invalid Service ID' unless @service
        raise 'Invalid token' if @service.access_token != params[:access_token]
      }
      get '' do
        result = {}
        service_hash = result[@service.id] = {}
        service_hash['name'] = @service.name
        service_hash['access_token'] = @service.access_token
        service_hash['created_at'] = @service.created_at
        service_hash['messages'] = @service.messages_hash
        result.to_json
      end

      post '/messages' do
        result = {}
        message = @service.messages.new body: params[:error_message]
        if message.save! 
          result = {success: true, msg: 'create success'}
          result['message_id'] = message.id
        else
          result = {success: false, msg: 'create fail'}
        end
        result.to_json
      end

      put '/messages/:message_id/delete' do
        result = {}
        message = @service.messages.select {|msg| msg.id == params[:message_id].to_i && msg.is_delete == false}.first
        raise 'invalid message_id' unless message
        if message.update(is_delete: true)
          result['success'] = true
          result['msg'] = 'delete success'
        else
          result['success'] = false
          result['msg'] = 'delete fail'
        end
        result.to_json
      end
    end
  end
end