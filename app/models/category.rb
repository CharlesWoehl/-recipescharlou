class Category < ApplicationRecord
  has_many :recipes
  has_one_attached :photo

end
