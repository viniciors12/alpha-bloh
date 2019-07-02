class ArticlesController < ApplicationController
    #calls that method only in some other methods
    before_action :set_article, only: [:edit, :update, :show, :destroy]



    def new
        @article = Article.new 
    end

    def create
        @article = Article.new(article_params)
        puts article_params

        if @article.save
            flash[:notice]="Article was successfuly created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end        
    
    def update
        if @article.update(article_params)
            flash[:notice] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        flash[:notice]="Article was successfully deleted"
        redirect_to articles_path
    end

    def index #for listing articles
        @articles = Article.all
    end

private
    def set_article
        @article = Article.find(params[:id])
    end
    def article_params
        #shows what was passed in inputs
        params.require(:article).permit(:title, :description)
    end

end
