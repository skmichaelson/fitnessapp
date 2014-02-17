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

  before_validation :ensure_session_token!

  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :gender, presence: true, inclusion: { in: %w(M F) }
  validates :current_wt, :goal_wt, :height, :activity_level, :birthday, presence: true

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  private

  def ensure_session_token!
    self.session_token ||= User.generate_session_token
  end
end
