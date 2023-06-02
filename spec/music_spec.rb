require_relative '../item'
require_relative '../music_classes/music'

RSpec.describe MusicAlbum do
  let(:genre) { Genre.new('Rock') }
  let(:album) { MusicAlbum.new(true, '2001-05-31', 'name') }

  describe '#can_be_archived?' do
    context 'when the album can be archived' do
      it 'private method can_be_archived? should return true' do
        result = album.send(:can_be_archived?)

        expect(result).to be(true)
      end
    end
  end

  describe '#move_to_archive' do
    context 'when the album can be moved to archive' do
      it 'instance variable archived should be true' do
        album.move_to_archive
        expect(album.archived).to be(true)
      end
    end
  end
end
