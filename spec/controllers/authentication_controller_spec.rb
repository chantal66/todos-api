require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe 'POST /auth/login' do
    let!(:user) { create(:user) }
    let(:headers) { valid_headers.except('Authorization')}
    let(:valid_credentials) do
      {
          email: user.email,
          password: user.password
      }
    end
    let(:invalid_credentials) do
      {
          email: Faker::Interner.email,
          password: Faker::Internet.password
      }.to_json
    end

    # returns auth token when request is valid
    context 'when request is valid' do
      before { post 'auth/login', params: valid_credentials, headers: headers }

      it 'returns an authenticated token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when request is not valid' do
      before { post 'auth/login', params: invalid_credentials, headers: headers }

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
