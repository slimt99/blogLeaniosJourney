module Api 
    class ArticlesController < ApiController
      before_action :http_authenticate

      def http_authenticate
        authenticate_or_request_with_http_basic do |username, password|
          if username == 'user1' && password == 'pwd1'
            true
          else
            false
          end
        end
      end

      def index
        articles = Article.all
        render json: articles
      end
      def show
            article = Article.find(params[:id])
        
            render json: article, serializer: Api::ArticleSerializer
        end
        def create
          article = Article.new(article_params)
          if article.save
            render json: article, status: :created
          else
            render json: article.errors, status: :unprocessable_entity
          end
        end
        def update
          article = Article.find(params[:id])
          article.update(article_params)
          render json: article, serializer: Api::ArticleSerializer
        end
        def destroy
          article = Article.find(params[:id])
          article.destroy
          head :no_content
        end

        private 
        def article_params
            params.require(:article).permit(:title, :body, :status, :picture, :user_id, :published_on_Leanios)
        end
    end
end 
