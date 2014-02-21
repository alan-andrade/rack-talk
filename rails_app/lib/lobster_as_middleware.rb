require 'rack'
require 'rack/lobster'
require 'faraday'
require 'pry'

module Rack
  class LobsterAsMiddleware
    def initialize app
      @app = app
      @lobster = Lobster.new
    end

    def call env
      req = Request.new env

      #raise 'failllll!'
      if req.path =~ /google/
        response = Faraday.get 'http://google.com'
        [200, {}, [response.body]]
        #@lobster.call env
      else
        @app.call env
      end
    end
  end
end
