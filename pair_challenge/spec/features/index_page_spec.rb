feature "index page" do
    scenario "user opens up website" do
        visit('/')
        expect(page).to have_content "Hello world"
    end
end