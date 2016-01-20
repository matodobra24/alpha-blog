class ArticlesController < ApplicationController
    
    #With in new action page. @article is equal to createing a new Article Database Object. Saves it as @article.
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save 
            flash[:notice] = "Article Successfully Saved!"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    private 
        def article_params
            params.require(:article).permit(:title, :description)
        end
    
end
