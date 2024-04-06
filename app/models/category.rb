class Category < ApplicationRecord
  has_many :recipes
  has_one_attached :photo
  def to_param
    "#{id}-#{name.parameterize}"
  end
end
