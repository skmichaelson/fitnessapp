class User < ActiveRecord::Base
  attr_accessible :username,
                  :password,
                  :email,
                  :current_wt,
                  :goal_wt,
                  :height,
                  :activity_level,
                  :birthday,
                  :about_me,
                  :my_inspiration,
                  :session_token,
                  :gender
  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
