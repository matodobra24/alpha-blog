class ArticlesController < ApplicationController
    
    #With in new action page. @article is equal to createing a new Article Database Object. Saves it as @article.
    def new
        @article = Article.new
    end
    
    def create
        #render plain: params[:article].inspect
        @article = Article.new(article_params)
        @article.save
        redirect_to articles_show(@article)
    end
    
    private 
        def article_params
            params.require(:article).permit(:title, :description)
        end
    
end
