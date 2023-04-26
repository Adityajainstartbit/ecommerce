class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_one_attached :image
  belongs_to :category
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { minimum: 10 }
 
  validates :image, presence: true
  validate :image_file_format

  def image_file_format
    return unless image.attached?

    if !image.blob.content_type.starts_with?('image/')
      image.purge
      errors.add(:image, 'must be an image file')
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
  
  
end
