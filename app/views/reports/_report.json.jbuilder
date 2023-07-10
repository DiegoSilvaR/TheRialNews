json.extract! report, :id, :image, :title, :description, :user_id, :created_at, :updated_at
json.url report_url(report, format: :json)
