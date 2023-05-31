require 'json'

def save_data(arr, path)
    File.write(path, JSON.generate(arr))
end

def load_data(path)
    if File.exist?(path)
      books_json = File.read(path)
      books_hash = JSON.parse(books_json)
    else
      []
    end
end
