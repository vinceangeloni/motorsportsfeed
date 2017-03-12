json.array!(@series) do |series|
  json.extract! series, :id, :name, :description, :logo, :feeds_id, :calendar_id
  json.url series_url(series, format: :json)
end
