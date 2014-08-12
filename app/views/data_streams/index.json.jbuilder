json.array!(@data_streams) do |data_stream|
  json.extract! data_stream, :id, :name, :csdl, :active
  json.url data_stream_url(data_stream, format: :json)
end
