class User < ApplicationRecord
  has_many :picks, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 1 }

  def authenticated?(token)
    digest = self.send("password_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
