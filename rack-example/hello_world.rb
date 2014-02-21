require 'rack'

app = Rack::Builder.new do
  run ->(env){[200, {}, ["Hi"] ]}
end

Rack::Server.start app: app, Port: 9292
