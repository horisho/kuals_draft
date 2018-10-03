class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 1 }

  private
#    def user_params
#      params.require(:user).permit(:name, :password, :password_confirmation)
#    end
end
