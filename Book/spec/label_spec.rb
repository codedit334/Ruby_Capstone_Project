require './Book/label'

describe Book do
  context 'should create instance of Book Class and Label Class' do
    book1 = Book.new('Publisher', 'good', '2022-01-01')
    label1 = Label.new('Title', 'red')

    it 'check for a book object' do
      expect(book1).to be_instance_of(Book)
    end

    it 'check for a label object' do
      expect(label1).to be_instance_of(Label)
    end

    it 'method add_item should add book to the label items array and add label to book' do
      label1.add_item(book1)

      expect(book1.label).to eq(label1)
      expect(label1.items).to eq([book1])
    end
  end
end
