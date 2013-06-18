json.array!(@projects) do |project|
  json.extract! project, :title, :url, :description, :image
  json.url project_url(project, format: :json)
end