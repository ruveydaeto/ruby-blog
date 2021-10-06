class ArticlesController < ApplicationController
    def index
        @articles = Article.all 
    end

    def show
      @article= Article.find(params[:id])   
      @comment = @article.comments.build 
    end
    def new
      @article = Article.new
    end

    def edit
      @article = Article.find(params[:id])
   end

    def create
      @note = Note.new note_params
      @tournament = @note.tournament
      if @note.save
       flash[:success] = (I18n.locale == :tr ? "Başarılı")
       redirect_to request.env['HTTP_REFERER']
     end
     def update
   @note = Note.find(params[:id])
   if @note.update(note_params)
    flash [:success] = (I18n.locale == :tr ? "Başarılı")
    redirect_to request.env['HTTP_REFERER']
   else
    flash[:error] = @note.errors.full_messages.join("/n")
    redirect_to request.env['HTTP_REFERER']
  end
end
  def destroy
    @article = Article.find(params[:id])
    @article.delete
    redirect_to articles_path
    end
    
     private
     def article_params
         params.require(:article).permit(:title, :text)
     end
     
end
