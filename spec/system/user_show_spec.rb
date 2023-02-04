require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Show' do
    before(:all) do
      @user = User.first
    end

    it 'shows the name' do
      visit(user_path(@user))

      expect(page).to have_content(@user.name)
    end

    it 'shows the profile picture' do
      visit(user_path(@user))

      expect(page).to have_css("img[src*=\"#{@user.photo}\"]")
    end

    it 'shows the bio' do
      visit(user_path(@user))

      expect(page).to have_text(@user.bio)
    end

    it 'shows a link to create a new post' do
      visit(user_path(@user))

      expect(page).to have_link(href: new_post_path)
    end

    it 'shows the last three posts' do
      visit(user_path(@user))

      @user.fetch_recent_posts.each do |post|
        expect(page).to have_text(post.title)
        expect(page).to have_text(post.text)
        expect(page).to have_link(href: user_post_path(@user.id, post.id))
      end
    end
  end
end
