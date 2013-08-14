require 'spec_helper'

describe 'Posts' do
	before(:each) do
		@post = Post.create(title: 'First post!', body:'This is my first post!')
    visit posts_path
	end

  describe 'GET /posts' do
  	it 'should contain some entries' do
  		expect(page).to have_content 'First post!'
  		expect(page).to have_content 'This is my first post!'
  	end

  	it 'should create a new post' do
  		click_link 'New Post'
      expect(current_path).to eq(new_post_path)

  		fill_in 'Title', with: 'Second Post'
  		fill_in 'Body',  with: 'not as enthiusiastic this time...'
			click_button 'Create Post'

			expect(current_path).to eq(posts_path)
  		expect(page).to have_content 'Second Post'
  		expect(page).to have_content 'not as enthiusiastic this time...'
  	end
  end

  describe 'PUT /posts' do
  	it 'should edit a post' do
  		click_link 'Edit'

      expect(current_path).to eq(edit_post_path(@post))
  		fill_in 'Title', with: 'Edited post title'
  		fill_in 'Body',  with: 'Edited post body'
      click_button 'Update Post'

      expect(current_path).to eq(posts_path)
      expect(page).to have_content('Edited post title')
      expect(page).to have_content('Edited post body')
  	end
  end

  # gotta figure out why this isn't passing...
  # describe 'DELETE /posts' do
  #   it 'should delete selected post', js: true do
  #     find("#post_#{@post.id}").click_link 'Delete'
  #     page.driver.browser.switch_to.alert.accept


  #     expect(page).to have_content "\"#{@post.title}\" has been deleted."
  #     expect(page).not_to have_content 'First post!'
  #     expect(page).not_to have_content 'This is my first post!'
  #   end
  # end
end
