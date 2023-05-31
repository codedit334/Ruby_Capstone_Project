require_relative '../item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
