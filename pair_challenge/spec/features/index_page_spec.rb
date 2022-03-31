feature "index page" do
    scenario "user opens up website" do
        visit('/')
        expect(page).to have_content "Bookmark Manager"
    end
end