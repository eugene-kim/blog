class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		Post.create(params[:post])
		redirect_to posts_path, notice: "Post was successfully updated"
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes params[:post]
			redirect_to posts_path, notice: "Post was successfully updated"		
		else
			redirect_to :back, notice: "There was an error updating your post"
		end
	end

	def destroy
		Post.destroy params[:id]
		redirect_to posts_path, notice: "Post has been deleted"
	end
end
