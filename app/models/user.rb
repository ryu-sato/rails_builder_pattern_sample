class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :ldap_authenticatable, :registerable,
    :recoverable, :rememberable,
    :timeoutable
    # LDAP ユーザ作成時に validation を行わないよう無効化する
    # :validatable

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
