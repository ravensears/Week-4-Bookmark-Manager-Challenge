require './app'

feature 'visiting the homepage' do
  scenario 'the page title is visible' do
    visit '/'

    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'viewing bookmarks' do
  scenario 'prints URLs to page' do
    visit '/bookmarks'

    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end
