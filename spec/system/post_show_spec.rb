require 'rails_helper'
RSpec.describe 'Posts show page', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:all) do
    @user = User.includes(:posts, :comments).first
    @post = @user.posts.first
  end

  it "shows post's title" do
    visit "/users/#{@user.id}/posts/#{@post.id}"

    expect(page).to have_text(@post.title)
  end

  it "shows post's author" do
    visit "/users/#{@user.id}/posts/#{@post.id}"

    expect(page).to have_content(@user.name)
  end

  it "shows post's number of commments" do
    visit "/users/#{@user.id}/posts/#{@post.id}"

    expect(page).to have_text(@post.comments_counter)
  end

  it "shows post's number of likes" do
    visit "/users/#{@user.id}/posts/#{@post.id}"

    expect(page).to have_text(@post.likes_counter)
  end

  it 'shows post body' do
    visit "/users/#{@user.id}/posts/#{@post.id}"

    expect(page).to have_text(@post.text)
  end

  it 'shows username of each commentor' do
    visit "/users/#{@user.id}/posts/#{@post.id}"

    if @post.comments_counter > 0
      comment = @post.comments.first.author

      expect(page).to have_text(comment.name)
    end
  end

  it 'show comments of commentors' do
    visit "/users/#{@user.id}/posts/#{@post.id}"

    if @post.comments_counter > 0
      comment = @post.comments.first

      expect(page).to have_text(comment.text)
    end
  end
end
