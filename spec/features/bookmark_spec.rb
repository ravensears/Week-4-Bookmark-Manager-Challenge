require './app'

feature 'bookmark homepage' do
  scenario 'loads homepage' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end
