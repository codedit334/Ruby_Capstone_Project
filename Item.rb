class Item
  attr_accessor :genre, :authour, :source, :label, :publish_date, :archived, :id

  def initialize(publish_date, archived)
    @id = rand(1..100)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive()
    @archived = true if(can_be_archived?)
  end

  private

  def can_be_archived?()
    Date.now.year - @publish_date.year > 10
  end
end
