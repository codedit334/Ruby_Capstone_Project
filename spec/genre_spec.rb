require_relative '../music_classes/genre'
require_relative '../music_classes/music'

RSpec.describe Genre do
  describe '#add_item' do
    it "sets the genre of an Item class' instance to the instance of the Genre class" do
      genre = Genre.new('Action')
      music_album = MusicAlbum.new(true, '2020-05-10')
      genre.add_item(music_album)

      expect(music_album.genre).to eq(genre)
      expect(genre.items).to eq([music_album])
    end
  end
end
