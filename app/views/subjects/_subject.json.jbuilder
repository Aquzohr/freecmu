json.extract! subject, :id, :sub_id, :sub_name, :sub_des, :created_at, :updated_at
json.url subject_url(subject, format: :json)
