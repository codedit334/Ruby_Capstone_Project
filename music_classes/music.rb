require_relative '../item'

class MusicAlbum < Item
  attr_reader :on_spotify
  attr_accessor :name

  def initialize(on_spotify, publish_date, name)
    super(publish_date)
    @on_spotify = on_spotify
    @name = name
  end

  def can_be_archived?
    super && @on_spotify
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def to_h
    {
      on_spotify: @on_spotify,
      publish_date: @publish_date,
      name: @name
    }
  end
end
