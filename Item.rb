class Item 
  initialize(genre, author, source, label, publish_date, archived) do
    @genre = genre
    genre.items << self
    @author = author
    author.items << self
    @source = source
    source.items << self
    @label = label
    label.items << self
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive()
    @archived = true if(can_be_archived?)
  end

  private

  def can_be_archived?()
    return false unless publish_date > 10
    true
  end
end
