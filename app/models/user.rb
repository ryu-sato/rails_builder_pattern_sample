# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  encrypted_password     :string           default(""), not null
#  external               :boolean          default(FALSE)
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
  rolify

  devise :database_authenticatable, :ldap_authenticatable, :timeoutable

  after_create :assign_default_role

  validates :username, presence: true, uniqueness: true
  validates :external, inclusion: { in: [true, false] }, exclusion: { in: [nil] }

  scope :internals, -> { where(external: false) }
  scope :externals, -> { where(external: true)  }

  # deviseのvalidatableでemailを不必要にする
  def email_required?
    false
  end

  # refs: https://github.com/plataformatec/devise/issues/4542
  def will_save_change_to_email?
    false
  end

  # LDAP ユーザの場合は external フラグを true にする
  def ldap_before_save
    self.encrypted_password = ""
    self.external = true
    self.add_role(:user)
  end

  # default の role を設定する
  def assign_default_role
    self.add_role(:guest) if self.roles.blank?
  end
end
