class User
  attr_reader :id
  @@registered_users = 0
  def initialize
    @@registered_users += 1
    @id = @@registered_users
  end
end