require 'rails_helper'
require 'capybara/rails'

RSpec.feature 'Users', type: :feature do
	
	# Tests to check if the devise log in system works
	# Only the last one should let the user in 
	
	before do 
		visit '/users/sign_in'
    expect(page).to have_content('Log in')
	end

	scenario 'try to sign in with wrong email', js: true do
    fill_in 'user[email]', with: "user@test.dev"
    fill_in 'user[password]', with: "123456"
    find('[name=commit]').click
    expect(page).not_to have_content("Welcome")
  end

  scenario 'try to sign in with wrong password', js: true do
    fill_in 'user[email]', with: "user@one.dev"
    fill_in 'user[password]', with: "azerty"
    find('[name=commit]').click
    expect(page).not_to have_content("Welcome")
  end

  scenario 'try to sign in with empty password', js: true do
    fill_in 'user[email]', with: "user@one.dev"
    fill_in 'user[password]', with: " "
		find('[name=commit]').click
    expect(page).not_to have_content("Welcome")
  end

  scenario 'try to sign in with the right password', js: true do
    fill_in 'user[email]', with: "user@one.dev"
    fill_in 'user[password]', with: "123456"
    find('[name=commit]').click
    expect(page).to have_content("Welcome")
  end

end
