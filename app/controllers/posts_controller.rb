class PostsController < ApplicationController
    def index
        @posts = Post.all #allメソッドはpostsテーブルのレコードを全て取得できるメソッド 
    end #indexのend

    def new
        @post = Post.new
    end #newのend
      
    def create
        @post = Post.new(post_params)
        if @post.save
          flash[:notice] = "新しい予定を登録しました"  
          redirect_to :posts
        else
          flash[:notice] = "スケジュールの登録に失敗しました"
          render "new"
        end

    end #createのend
        
    def show
      @post = Post.find(params[:id])
    end

    def edit
      @post = Post.find(params[:id])
    end
  
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
     
        flash[:notice] = "ユーザーIDが「#{@post.id}」の情報を更新しました"
        redirect_to :posts
      else
        render "edit"
      end
    end #updateのend

  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      flash[:notice] = "予定を削除しました"
      redirect_to :posts
    end

    private
    def post_params
    params.require(:post).permit(:title, :start_at, :end_at, :all_day, :memo)
    end

    
end
