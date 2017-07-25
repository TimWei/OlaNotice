require_relative 'routes/billboard'
require_relative 'routes/service'

class ErrMonitor < Sinatra::Base
  namespace '/api' do
    before {
      raise 'forbidden request' unless settings.host_whitelist.include? request.host_with_port
    }
    get {      
          {
            msg: 'welcome to C4t monitor',
            version: settings.version,
            environment: settings.environment,
            root_path: $root_path,
            tasks_path: $root_path + settings.tasks_path
          }.to_json
        }
  end
end