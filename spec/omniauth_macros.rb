module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:linkedin] = {
        "provider"=>"linkedin",
        "uid"=>"AbC123",
        "info"=> {
            "email"=>"user@example.com",
            "first_name"=>"John",
            "last_name"=>"Doe",
            }
    }
  end
end