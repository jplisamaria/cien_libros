Book.destroy_all
open('data/test_books.csv') do |books|
  books.read.each_line do |book|
    title, author = book.chomp.split(",")
    Book.create!(:title => title, :author => author)
  end
end

