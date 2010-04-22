class PostsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@posts = @user.posts
	end

	def show
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])
	end

	def new
		@user = User.find(params[:user_id])
		@post = @user.posts.build
	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.build(params[:post])
		if @post.save
			redirect_to user_post_url(@user, @post)
		else
			render :action => "new"
		end
	end
	
	def edit
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])
	end
	
	def update
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to user_post_url(@user, @post)
		else
			render :action => "edit"
		end
	end
	
	def destroy
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])
		@post.destroy
		
		respond_to do |format|
			format.html { redirect_to user_posts_path(@user) }
			format.xml 	{ head :ok }
		end
	end
end
