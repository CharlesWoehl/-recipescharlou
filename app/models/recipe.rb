class Recipe < ApplicationRecord
  belongs_to :category
  has_one_attached :photo
  def to_param
    name
  end
end
