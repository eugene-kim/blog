require 'spec_helper'

describe "Comments" do
	before(:each) do
		@post = Post.create(title: "sample post", body: "body of the sample post")
		@comment = @post.comments.create(commenter: "Eugene", body: "lalalalala")
		visit post_path(@post)
	end

  describe "GET /comments" do
  	it "should create a new comment" do
  		fill_in "comment_commenter", with: "Eugenius"
  		fill_in "comment_body",      with: "This post is magnificent!"
  		save_and_open_page
  		click_button "Add Comment"

  		expect(current_path).to eq(post_path(@post))
  		expect(page).to have_content "Eugenius"
  		expect(page).to have_content "This post is magnificent!"
  	end
  end

  describe "PUT /comments" do
  end

  describe "DELETE /comments" do
    it "should delete a specified comment" do
      find("#comment_#{@comment.id}").click_link "Destroy Comment"
      expect(current_path).to eq(post_path(@post))
      expect(page).not_to have_content "Eugene"
      expect(page).not_to have_content "lalalalala"
    end
  end
end
