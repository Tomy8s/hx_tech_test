class Users
  @@user_list = []
  def self.create(user_data)
    @@user_list << User.new(user_data)
  end

  def self.return_user(index=0)
    user = @@user_list[index]
    user.display_json
  end
end