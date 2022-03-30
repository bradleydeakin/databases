feature 'add website as a bookmark' do
    scenario 'user wants to add jdsports to their bookmarks' do
        visit('/bookmarks/new')
        fill_in :url, with: 'http://www.jdsports.com'
        click_button('Submit')

        expect(page).to have_content 'http://www.jdsports.com'
    end
end