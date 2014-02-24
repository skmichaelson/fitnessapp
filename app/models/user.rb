class User < ActiveRecord::Base
  include UsersHelper

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
                  :gender,
                  :city,
                  :state,
                  :zipcode,
                  :age
  attr_reader :password

  before_validation :ensure_session_token
  after_create :calculate_user_age
  after_create :create_food_diary

  validates :username, presence: { message: "Please choose a username" }, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :gender, presence: true, inclusion: { in: %w(M F), message: nil }
  validates :current_wt, presence: { message: "Please enter your current weight" }
  validates :goal_wt, :height, :activity_level, :birthday, presence: true

  has_one :goal, inverse_of: :user, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend
  # TODO: Fix messages!

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    storedPassword = BCrypt::Password.new(self.password_digest)
    storedPassword.is_password?(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(unique_id, password)
    user = User.where("username = ?", unique_id).first
    user ||= User.where("email = ?", unique_id).first

    user.try(:is_password?, password) ? user : nil
  end

  def self.find_by_session_token(session_token)
    User.where("session_token = ?", session_token).includes("goal").first
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def create_food_diary
    self.diaries.create
  end

  def calculate_user_age
    set_user_age(self)
  end
end
