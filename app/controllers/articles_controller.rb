class ArticlesController < ApplicationController
	#Callbacks

	before_action :authenticate_user!, except:[:show, :index]
	before_action :set_article, except:[:index, :new, :create]

	#GET /articles
	def index
		@article = Article.all #Obtiene todos los registros de la tabla que corresponde al modelo
	end

	#GET /articles/:id
	def show
		@article.update_visits_count
		@comment = Comment.new
	end
	#GET /articles/new
	def new
		@article = Article.new
	end

	#POST /articles
	def create
		@article = current_user.articles.new(article_params)
		
	if	@article.save
		redirect_to @article
	else
		render :new
	end
	end

	def update
		#@article.update_atrributes({title: 'Nuevo título'})

		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	def destroy

		@article.destroy #Destroy elimina el objeto de la BD
		redirect_to articles_path
	end

	def edit


	end

	private

		def set_article
			@article = Article.find(params[:id])
		end
		def article_params
			params.require(:article).permit(:title, :body)
		end

	
end