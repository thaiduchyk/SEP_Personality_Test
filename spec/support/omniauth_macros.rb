module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] = {
        provider: 'facebook',
        uid: '123545',
        user_info:{
            name:'username',
            email: 'foobar@example.com',
        },
        credentials: {
            token: 'mock_token',
            secret: 'mock_secret'
        }
    }
  end
end
