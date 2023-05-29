class Item 
initialize (genre, author, source, label, publish_date, archived)
  @genre = genre
  genre.items << self
  @author = author
  author.items << self
  @source = source
  source.items << self
  @label = label
  label.items << self
  @publish_date = publish_date
  publish_date.items << self
  @archived = archived
  archived.items << self
end

end