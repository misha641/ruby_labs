
class Medicine < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :category, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 1000 }, allow_blank: true

  validate :validate_image

  private

  def validate_image
    return unless image.attached?

    unless image.blob.content_type.in?(%w[image/jpeg image/png image/webp])
      errors.add(:image, "повинно бути у форматі JPG, PNG або WebP")
    end

    if image.blob.byte_size > 5.megabytes
      errors.add(:image, "не повинно перевищувати 5 МБ")
    end
  end
end
