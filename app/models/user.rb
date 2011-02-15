class User < ActiveRecord::Base
  
  has_many :submissions
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def role_symbols  
    return [:admin] if admin?
    [:user]
  end
end


# == Schema Info
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  admin                :boolean
#  current_sign_in_ip   :string(255)
#  email                :string(255)     not null, default("")
#  encrypted_password   :string(128)     not null, default("")
#  last_sign_in_ip      :string(255)
#  password_salt        :string(255)     not null, default("")
#  remember_token       :string(255)
#  reset_password_token :string(255)
#  sign_in_count        :integer         default(0)
#  created_at           :datetime
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  remember_created_at  :datetime
#  updated_at           :datetime