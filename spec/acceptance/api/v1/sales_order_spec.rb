require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Session' do
  before do
    header 'Content-Type', 'application/json'
  end

  post '/api/v1/sessions' do
    let!(:user) { create(:user) }

    parameter :email, 'Type' => 'String', scope: %i[user]
    parameter :password, 'Type' => 'String', scope: %i[user]

    example 'Success update sales order', document: :public do
      header 'Authorization', user.token
      do_request(user: { email: user.email, password: user.password })

      expect(status).to eq 201
    end
  end
end
