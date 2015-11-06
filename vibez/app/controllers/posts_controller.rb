class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@moods = ['happy', 'good', 'euphoric', 'ecstasy', 'so so']
		@users = User.all.map do |x| 
			[ x.username, x.id ]
		end	
	end

	def create
		@post = Post.new(post_params)
	  @post.save
	  redirect_to posts_path
	end

	def edit
		@post = Article.find(params[:id])
		@moods = ['happy', 'good', 'euphoric', 'ecstasy', 'so so']
		@users = User.all.map do |x| 
			[ x.username, x.id ]
		end	
	end

	def update
	  @post = Article.find(params[:id])
	  @post.update(post_params)

	  flash.notice = "Article '#{@post.title}' Updated!"


	  redirect_to posts_path
	end

	private

	def post_params
		params.require(:post)
			.permit(:song_title, :artist_name, :vibe, :like, :user_id)
	end
end

