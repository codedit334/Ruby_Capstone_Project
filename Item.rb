class Item
  attr_accessor :genre, :authour, :source, :label, :publish_date, :archived, :id

  initialize(genre, author, source, label, publish_date, archived) do
    @id = rand(1 .. 100)
    @genre = genre
    @author = author
    @source = source
    @label = label
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
