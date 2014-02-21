require 'rack'
require 'rack/lobster'
require 'pry'

module Rack
  class LobsterAsMiddleware
    def initialize app
      @app = app
      @lobster = Lobster.new
    end

    def call env
      req = Request.new env

      if req.path =~ /lobster/
        @lobster.call env
      else
        @app.call env
      end
    end
  end
end
