require 'json'

def save_data(arr, path)
  File.write(path, JSON.generate(arr))
end

def load_data(path)
  return JSON.parse(File.read(path)) if File.exist?(path)

  []
end
