module Api
  module V1
    class BaseController < ApplicationController
      include AuthConcern
    end
  end
end
