class UsersController < ApplicationController
  def index
    respond_with_interaction Users::IndexInteraction
  end

  def show
    respond_with_interaction Users::ShowInteraction, user_params
  end

  def update
    respond_with_interaction Users::UpdateInteraction, user_params
  end

  def destroy
    respond_with_interaction Users::DestroyInteraction, user_params
  end

  private

  def user_params
    params.permit!
  end
end
