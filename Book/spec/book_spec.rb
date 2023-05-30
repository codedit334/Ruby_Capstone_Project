require './Book/book'

describe Book do
  context 'should create instance of Book Class' do

    book1 = Book.new('Publisher', 'good', '2022-01-01', false)
    book2 = Book.new('Publisher', 'good', '2022-01-01', false)
    book2 = Book.new('Publisher', 'bad', '2022-01-01', false)
    
    it 'check for a book object' do
        expect(book1).to be_instance_of(Book)
    end

#     it 'returns correct title' do
#       expect(book.title).to eq('Brave New World')
#     end

#     it 'returns correct author' do
#       expect(book.author).to eq('Aldous Huxley')
#     end
   end
end