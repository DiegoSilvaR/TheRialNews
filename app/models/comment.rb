class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :report
  # Resto del código del modelo
end
