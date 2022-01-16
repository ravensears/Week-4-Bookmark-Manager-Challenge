feature 'add bookmarks' do
  scenario 'it lets you add a bookmark' do
    visit ('/bookmarks/add')
    fill_in('url', with: 'http://www.youtube.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    
    expect(page).to have_link('Test Bookmark', href: 'http://www.youtube.com')
  end 
end 
