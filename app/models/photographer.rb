class Photographer < ApplicationRecord
  attr_accessor :remember_token
  has_many :packages, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates_acceptance_of :accepted, allow_nil: false, on: :create
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  class << self
  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def new_token
    SecureRandom.urlsafe_base64
  end
end
  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = Photographer.new_token
    update_attribute(:remember_digest, Photographer.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
