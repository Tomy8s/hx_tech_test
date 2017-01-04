class Users
  @@user_list = []
  def self.create(user_data)
    @@user_list << User.new(user_data)
  end

  def self.return_user(id=false)
    if @@user_list.empty?
      'not found'
    elsif id
      @@user_list.each do |u|
        found = false
        if u.get_id == id
          return u.display_json
        end
      end
      'not found'
    else
      @@user_list.last.display_json
    end
  end

  def self.update_user(user_data)
    p user_data[:id]
    @@user_list.each do |u|
      if u.get_id == user_data[:id].to_i
        return u.update(user_data)
      end
    end
    'not found'
  end

  def self.delete_user(id)
    @@user_list.each do |u|
      if u.get_id == id
        @@user_list.delete(u)
        return true
      end
    end
    false
  end
end