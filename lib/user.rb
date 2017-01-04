class User
  @@registered_users = 0

  def initialize user_data
    @@registered_users += 1
    @id = @@registered_users
    @email = user_data[:email] || nil
  end

  def get_id
    return_id = @id
    return_id
  end

  def get_email
    @email.dup
  end
end