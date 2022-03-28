feature 'viewing bokkmarks' do
    scenario "user clicks on bookamrks to see a list of URLs" do
        visit('/bookmarks')
        expect(page).to have_content "https://github.com"
        expect(page).to have_content "https://makers.com"
        expect(page).to have_content "https://wikipedia.com"
    end
end