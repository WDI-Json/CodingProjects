class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true,
                     format: { with: /\A[A-Z0-9]+\z/i },
                     uniqueness: { case_sensitive: false }
  validates :email, email: {mode: :strict, require_fqdn: true},
    uniqueness: { case_sensitive: false} 

  validates :password, length: { minimum: 10, allow_blank: true }

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end
end
