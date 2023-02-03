require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Index' do
    before(:all) do
      @users = User.limit(5)
    end

    it 'shows all the properties (name, photo, number of posts) of each user' do
      visit users_path

      @users.each do |user|
        expect(page).to have_text(user.name)
        expect(page).to have_css("img[src*=\"#{user.photo}\"]")
        expect(page).to have_text(user.posts_counter)
        expect(page).to have_link(href: user_path(user))
      end
    end

    it 'redirects to user show page when clicking the user' do
      visit users_path

      user = @users.first
      click_on user.name, match: :first

      expect(page).to have_current_path user_path(user)
    end
  end
end
