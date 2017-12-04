# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

require 'rack/cors'
use Rack::Cors do
  # allow all origins in development
  allow do
    origins '*'
    resource '/api/v1',
             headers: :any,
             methods: %i[get post delete put options head],
             credentials: true,
             max_age: 0
    resource '*',
             headers: :any,
             methods: %i[get post delete put options head],
             max_age: 0
  end
end
