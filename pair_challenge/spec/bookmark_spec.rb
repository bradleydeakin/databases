require 'bookmark'

RSpec.describe 'bookmark_list' do
    it 'returns a list of bookmarks' do
        connection = PG.connect(dbname: 'bookmark_manager_test')

        connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
        connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
        connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
        bookmarks = Bookmark.new
        expect(bookmarks.bookmark_list).to include "http://www.makersacademy.com"
        expect(bookmarks.bookmark_list).to include "http://www.google.com"
        expect(bookmarks.bookmark_list).to include "http://www.destroyallsoftware.com"
    end


end 

describe '.add' do
    it 'adds a new bookmark' do
        bookmarks = Bookmark.new
        bookmarks.add('http://www.jdsports.com')

        expect(bookmarks.bookmark_list).to include "http://www.jdsports.com"
    end
end