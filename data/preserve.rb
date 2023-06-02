require 'json'

def save_data_to_path(arr, path)
  File.write(path, JSON.generate(arr))
end

def load_data_from_path(path)
  return JSON.parse(File.read(path)) if File.exist?(path)

  []
end
