require 'rails_helper'

describe 'User show page' do
  before(:all) do
    @user = User.first
    @posts = Post.where(author_id: @user.id)
  end

  it 'test for profile picture' do
    visit("/users/#{@user.id}")

    expect(page).to have_css("img[src*=\"#{@user.photo}\"]")
  end

  it "test for user's name visibility" do
    visit("/users/#{@user.id}")

    expect(page).to have_content(@user.name)
  end

  it 'shows number of posts the user has written' do
    visit("/users/#{@user.id}")

    expect(page).to have_text(@user.posts_counter)
  end

  it 'shows the bio' do
    visit("/users/#{@user.id}")

    expect(page).to have_text(@user.bio)
  end

  it "shows a link to view all of this user's post" do
    visit("/users/#{@user.id}")

    expect(page).to have_link(href: "/users/#{@user.id}/posts")
  end

  it 'redirects to post show page when clicking the show all posts link' do
    visit("/users/#{@user.id}")
    post = @posts.first
    click_on post.title, match: :first

    expect(page).to have_current_path "/users/#{@user.id}/posts/#{post.id}"
  end

  it 'redirects to post index page when clicking the show all posts link' do
    visit("/users/#{@user.id}")

    click_on 'Show all posts', match: :first
    expect(page).to have_current_path "/users/#{@user.id}/posts"
  end

  it 'shows the last three posts' do
    visit("/users/#{@user.id}")
    posts = @posts.limit(3)
    posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end
end
