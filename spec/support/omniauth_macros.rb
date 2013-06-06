module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:dropbox] = {
      'uid' => '123545',
      'info' => {
        'name' => 'mockuser',
        'email' => 'mock_user_thumbnail_url'
      },
      'extra' => {
        'access_token' => {
          'token' => 'mock_token',
          'secret' => 'mock_secret'
        }
      }
    }
  end
end

