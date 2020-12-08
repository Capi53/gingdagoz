class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_secure_password
  validates :role_id, presence: true

  enum role_id: { student: 1, ta: 2, teacher: 3 }

  def show
    @member = User.find(params[:id])
  end  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
