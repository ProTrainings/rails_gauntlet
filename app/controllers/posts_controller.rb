class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            flash.now[:notice] = "success"
        else
            flash.now[:alert] = "error"
            render :new, status: :unprocessable_entity
        end
    end

    private

    def post_params
        params.expect(post: [:title, :description, :body ])
    end
end
