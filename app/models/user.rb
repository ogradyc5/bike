class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.email = email.downcase }
  has_many :bookings, dependent: :destroy
  has_many :store_bicycles, through: :bookings
  has_many :friendships
  has_many :activities
  has_many :friends, through: :friendships
  acts_as_voter
         
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
  uniqueness: { case_sensitive: false },
  format: { with: VALID_EMAIL_REGEX }
  
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end 
  
  def under_store_bicycle_limit?
    (bookings.count < 2)
  end
  
  def can_add_store_bicycle?(id)
    under_store_bicycle_limit? && !store_bicycle_already_added?(id)
  end
  
  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end
  
  def not_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count < 1
  end
  
  def self.search(param)
    param.strip!
    param.downcase!
    to_send_back = (first_name_matches(param)+last_name_matches(param)+email_matches(param)).uniq
    return nil unless to_send_back
    to_send_back
  end 
  
  def self.first_name_matches(param)
    matches('first_name', param)
  end

  def self.last_name_matches(param)
    matches('last_name', param)
  end

  def self.email_matches(param)
    matches('email', param)
  end

  def self.matches(field_name, param)
    User.where("#{field_name} like ?", "%#{param}%")
  end

end
