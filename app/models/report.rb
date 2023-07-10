class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # Resto del código del modelo
end
