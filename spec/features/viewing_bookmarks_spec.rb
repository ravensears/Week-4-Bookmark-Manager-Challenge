require './app'

feature 'visiting the homepage' do
  scenario 'the page title is visible' do
    visit '/'

    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'viewing bookmarks' do
  scenario 'prints URLs to page' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit '/bookmarks'

    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end
