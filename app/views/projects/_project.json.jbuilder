json.extract! project, :id, :name, :notes, :progress, :status, :created_at, :updated_at
json.url project_url(project, format: :json)