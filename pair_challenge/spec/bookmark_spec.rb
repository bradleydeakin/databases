require 'bookmark'
require 'database_helper'

RSpec.describe 'bookmark_list' do
    it 'returns a list of bookmarks' do
        connection = PG.connect(dbname: 'bookmark_manager_test')

       bookmark1 =  Bookmark.add(url:'http://www.makersacademy.com', title: 'Makers Academy')
       bookmark2 = Bookmark.add(url:'http://www.destroyallsoftware.com', title: 'Destroy All Software')
       bookmark3 = Bookmark.add(url: 'http://www.google.com', title: 'Google')
       
       bookmarks = Bookmark.all

       expect(bookmarks.length).to eq 3 
       expect(bookmarks.first).to be_a Bookmark
       expect(bookmarks.first.id).to eq bookmark1.id
       expect(bookmarks.first.title).to eq 'Makers Academy'
       expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

       expect(bookmarks.length).to eq 3 
       expect(bookmarks[1]).to be_a Bookmark
       expect(bookmarks[1].id).to eq bookmark2.id
       expect(bookmarks[1].title).to eq 'Destroy All Software'
       expect(bookmarks[1].url).to eq 'http://www.destroyallsoftware.com'
       
       expect(bookmarks.length).to eq 3 
       expect(bookmarks[2]).to be_a Bookmark
       expect(bookmarks[2].id).to eq bookmark3.id
       expect(bookmarks[2].title).to eq 'Google'
       expect(bookmarks[2].url).to eq 'http://www.google.com'
    end


end 

describe '.add' do
    it 'adds a new bookmark' do
        
        bookmark = Bookmark.add(url: 'http://www.jdsports.com', title: 'JD Sports')
        persisted_data = persisted_data(id: bookmark.id)
 
        expect(bookmark.id).to eq persisted_data.first[1]
        expect(bookmark).to be_a Bookmark
        expect(bookmark.title).to eq 'JD Sports'
        expect(bookmark.url).to eq 'http://www.jdsports.com'
    end
end

describe '.delete' do
    it 'deletes a bookmark' do
        bookmark = Bookmark.add(url: 'http://www.jdsports.com', title: 'JD Sports')

        Bookmark.delete(id: bookmark.id)

        expect(Bookmark.all.length).to eq 0
    end
end