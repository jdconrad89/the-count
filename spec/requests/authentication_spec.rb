# require 'rails_helper'
#
# describe 'Authentication' do
#   let(:user) { User.first }
#   before do
#     oauth_setup
#     Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
#     get '/auth/facebook/callback'
#   end
#
#   it 'should sign a user in' do
#     expect(User.count).to eq(1)
#     expect(user.uid).to eq(1234567)
#     expect(user.name).to eq('Joe Bloggs')
#     expect(user.email).to eq('joe@bloggs.com')
#   end
# end
