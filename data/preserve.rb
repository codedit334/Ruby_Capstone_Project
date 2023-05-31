def save_data(obj, path)
    File.write(path, JSON.generate(obj))
end

def load_Data(path)
    if File.exist?(path)
      books_json = File.read(path)
      books_hash = JSON.parse(books_json)
    else
      []
    end
end
