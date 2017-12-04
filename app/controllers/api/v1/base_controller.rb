module Api
  module V1
    class BaseController < ApplicationController
      include AuthConcern
      include RescueFromConcern
    end
  end
end
