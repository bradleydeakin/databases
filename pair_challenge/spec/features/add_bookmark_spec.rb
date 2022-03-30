feature 'add website as a bookmark' do
    scenario 'user wants to add jdsports to their bookmarks' do
        visit('/bookmarks/new')
        fill_in :url, with: 'http://www.jdsports.com'
        fill_in :title, with: 'JD Sports'
        click_button('Submit')

        expect(page).to have_link 'JD Sports', href: 'http://www.jdsports.com'
    end
end