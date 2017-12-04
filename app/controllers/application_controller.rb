class ApplicationController < ActionController::API
  def respond_with_interaction(interaction_class, params = {})
    interaction = interaction_class.run! params
    render json: interaction
  end
end
