class User < ApplicationRecord
  has_many :attendance_systems, dependent: :destroy
  attr_accessor :remember_token
  before_save{ self.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
                    
  validates :department, presence: true, length: { in: 2..50 }, allow_blank: true
  validates :work_time, presence: true
  validates :basic_time, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
 
  
   # 渡された文字列のハッシュ値を返します。
  def User.digest(string)
    cost =
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        Bcrypt::Engine.cost
      end
    Bcrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandam.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authentiated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest,nil)
  end
  
  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end