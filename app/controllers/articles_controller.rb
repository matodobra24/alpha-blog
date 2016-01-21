class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
    end
    #With in new action page. @article is equal to createing a new Article Database Object. Saves it as @article.
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
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
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article Was Successfully Updated!"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "You have successfully deleted this article!"
        redirect_to articles_path
    end
    private 
        def article_params
            params.require(:article).permit(:title, :description)
        end
    
end
