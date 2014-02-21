module UsersHelper
  def set_user_age(user)
    age = Date.today.year - user.birthday.year
    if Date.today.month < user.birthday.month &&
      Date.today.day < user.birthday.day
      age -= 1
    end
    user.update_attributes(age: age)
  end
end
