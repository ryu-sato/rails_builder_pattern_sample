# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable

  validates :username, presence: true, uniqueness: true

  # deviseのvalidatableでemailを不必要にする
  def email_required?
    false
  end

  # refs: https://github.com/plataformatec/devise/issues/4542
  def will_save_change_to_email?
    false
  end
end
