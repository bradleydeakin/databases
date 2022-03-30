require 'bookmark'

RSpec.describe 'bookmark_list' do
    it 'returns a list of bookmarks' do
        connection = PG.connect(dbname: 'bookmark_manager_test')

        connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
        connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
        connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
        
        expect(Bookmark.all).to include "http://www.makersacademy.com"
        expect(Bookmark.all).to include "http://www.google.com"
        expect(Bookmark.all).to include "http://www.destroyallsoftware.com"
    end


end 

describe '.add' do
    it 'adds a new bookmark' do
        
        bookmark = Bookmark.add('http://www.jdsports.com', 'JD Sports').first

        expect(bookmark['url']).to eq "http://www.jdsports.com"
        expect(bookmark['title']).to eq "JD Sports"
    end
end