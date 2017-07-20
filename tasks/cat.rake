namespace :cat do 
  desc 'generating testing data'
  task :make_dumbies do
    services = ['service1', 'service2']
    services.each do |serv|
      msg_count = 5
      ActiveRecord::Base.transaction do
        record = Service.create name:serv,  access_token: SecureRandom.hex(32)
        while msg_count > 0 
          record.messages.create body: 'random message'
          msg_count -= 1
        end
      end
    end
  end

  desc 'new service'
  task :new do
    service_name = ENV['name'] 
    begin
      raise "invalid name,\n correct: rake cat:new name=SERVICE_NAME" unless service_name
      service_access_token = SecureRandom.hex(32)
      puts '======================='
      puts 'Service Name: ' + service_name
      puts 'Service Access Token: ' + service_access_token
      puts '======================='
    rescue => e
      puts "MESSAGE: " + e.message
    end 
  end
end
