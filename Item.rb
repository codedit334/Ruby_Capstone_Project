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

  def can_be_archived?()
    return false unless publish_date > 10
    true
  end

  def move_to_archive()
    @archived = true if(can_be_archived?)
  end
end

# can_be_archived?() in the Item class
# should return true if published_date is older than 10 years
# otherwise, it should return false
# move_to_archive() in the Item class
# should reuse can_be_archived?() method
# should change the archived property to true if the result of the can_be_archived?() method is true
# should do nothing if the result of the
# can_be_archived?() method is false

# Create a main.rb file that will serve as your console app entry-point.
# Implement startup actions:
# Present the user with a list of options to perform.