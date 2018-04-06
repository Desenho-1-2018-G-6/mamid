json.extract! user, :id, :name, :email, :cpf, :birth_date, :gender, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
