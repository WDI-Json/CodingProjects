class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie
  
  has_one_attached :profile_image
  validate :acceptable_profile_image

  scope :by_name, -> { order(:name) }
  scope :not_admins, -> { by_name.where(admin: false) }

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

  def acceptable_profile_image
    return unless profile_image.attached?
  
    unless profile_image.blob.byte_size <= 1.megabyte
      errors.add(:profile_image, "is too big")
    end
  
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(profile_image.content_type)
      errors.add(:profile_image, "must be a JPEG or PNG")
    end
  end
end
