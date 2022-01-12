feature 'add bookmarks' do
  scenario 'it lets you add a bookmark' do
    visit ('/bookmarks/add')
    fill_in('url', with: 'https://www.youtube.com')
    click_on 'Add Bookmark'
    expect(page).to have_content 'https://www.youtube.com'
  end 
end 
