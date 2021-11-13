class UserSerializer
  def self.generate_api_key(new_user)
    {
      data: {
        type: 'users',
        id: new_user.id.to_s,
        attributes: {
          email: new_user.email,
          api_key: new_user.api_key
        }
      }
    }
  end
end
