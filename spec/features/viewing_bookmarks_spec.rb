require './app'

feature 'visiting the homepage' do
  scenario 'the page title is visible' do
    visit('/')

    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'viewing bookmarks' do
  scenario 'prints URLs to page' do
    Bookmark.add(title: 'Makers', url: "http://www.makersacademy.com")
    Bookmark.add(title: 'Destroy Software', url: "http://www.destroyallsoftware.com")
    Bookmark.add(title: 'Google', url: "http://www.google.com")

    visit('/bookmarks')

    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy Software', href: 'http://www.destroyallsoftware.com')
  end
end
