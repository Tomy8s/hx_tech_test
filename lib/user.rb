class User
  @@registered_users = 0

  def initialize
    @@registered_users += 1
    @id = @@registered_users
  end

  def get_id
    return_id = @id
    return_id
  end
end