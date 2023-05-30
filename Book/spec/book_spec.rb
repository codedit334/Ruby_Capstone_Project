require './Book/book'

describe Book do
  context 'should create instance of Book Class' do

    book1 = Book.new('Publisher', 'good', '2022-01-01')
    book2 = Book.new('Publisher', 'good', '01-01-2000')
    book3 = Book.new('Publisher', 'bad', '2022-01-01')
    
    it 'check for a book object' do
        expect(book1).to be_instance_of(Book)
    end

    it "private method can_be_archived? should return true" do
        result = book3.send(:can_be_archived?)
  
        expect(result).to be(true)
      end

    it 'method move_to_archive should make @archive true' do
        book3.move_to_archive()

        expect(book3.archived).to be(true)
    end

    it 'method move_to_archive should make @archive true' do
        book2.move_to_archive()

        expect(book2.archived).to be(true)
    end

    it 'method move_to_archive shouldn\'t make @archive true' do
        book1.move_to_archive()

        expect(book1.archived).to be(false)
    end
   end
end