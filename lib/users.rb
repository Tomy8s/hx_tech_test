class Users
  @@user_list = []
  def self.create(user_data)
    @@user_list << User.new(user_data)
  end

  def self.return_user(id=false)
    if id
      @@user_list.each do |u|
        if u.get_id == id
          return u.display_json
        end
      end
    else
      @@user_list.last.display_json
    end
  end
end