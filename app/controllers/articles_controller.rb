class ArticlesController < ApplicationController
    def new
	@article = Article.new
    end
    def create
	#@article = Article.new(params[:article])
	@article = Article.new(article_params)
       if @article.save
           redirect_to @article #客户端的redirect 
       else
           render "new"  # 使用render @article对象会被传回new 使用的是create的request,相当与服务器端的
       end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def index
       @articles = Article.all
    end
   
    def edit
      @article = Article.find(params[:id])
    end 

   def update
      @article = Article.find(params[:id])
 
     if @article.update(article_params)
         redirect_to @article
     else
       render 'edit'
     end
   end
   
   def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path
   end
private
    def article_params
	params.require(:article).permit(:title,:text)
    end
end
