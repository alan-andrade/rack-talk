require 'rack'
require 'rack/lobster'

app = Rack::Builder.new do
  use Rack::ShowExceptions
  run Rack::Lobster.new
end

Rack::Server.start app: app, Port: 9292
