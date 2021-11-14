class SessionSerializer
  def self.authenticated_user(user)
    {
      data: {
        type: 'users',
        id: user.id.to_s,
        attributes: {
          email: user.email,
          api_key: user.api_key
        }
      }
    }
  end
end
