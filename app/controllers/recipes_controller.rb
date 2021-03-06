class RecipesController < ApplicationController
  before_action :logged_in_author, only: [:new, :create, :edit]
  before_action :correct_author, only:[:edit, :update, :release, :destroy]
  
  def index
    @keyword = params[:search] 
    @recipes_count = Recipe.search(@keyword)
    @recipes = @recipes_count.order(updated_at: "DESC").page(params[:page]).per(20)
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      @recipe.procedure.create(number: 1, content: "")
      @recipe.ingredient.create(number: 1)
      redirect_to edit_recipe_path(@recipe)
    else
      render "new"
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    @ingredients = IngredientCollection.new( [], @recipe)
    @procedures = @recipe.procedure.order(number: "ASC")
    @procedure = @recipe.procedure.build
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      respond_to do |format|
        format.html {redirect_to edit_recipe_path(@recipe)}
        format.js
      end
    else
      @ingredients = IngredientCollection.new( [], @recipe)
      @procedures = @recipe.procedure.order(number: "ASC")
      render "edit"
    end
  end
  
  #@recipe,@userはcorrect_userで設定
  def destroy
    @recipe.destroy
    flash[:success] = "レシピを削除しました"
    redirect_to user_path(@user)
  end
  
  def release
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(release: params[:release])
      if @recipe.release == true
        flash[:success] = "レシピを公開しました"
        redirect_to recipe_path(@recipe)
      else
        flash[:success] = "レシピを下書きにしました"
        redirect_to user_path(id: @recipe.user_id)
      end
    else
      render "edit"
    end
  end
  
  def liked
    @recipe = Recipe.find(params[:id])
    @liked_user = @recipe.likes.page(params[:page])
  end
  
  def show
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.present?
      @tweet_url = URI.encode(
        "http://twitter.com/intent/tweet?original_referer=" +
        request.url +
        "&url=" +
        request.url +
        "&text=" +
        @recipe.name + "のレシピを見ています！"
      )
      @user_comments = @recipe.impressions.page(params[:page]).per(5)
    else
      flash[:danger] = "レシピが見つかりませんでした"
      redirect_to root_url
    end
  end
  
  private
  
    #Recipeのストロングパラメーター
    def recipe_params
      params.require(:recipe).permit(:name, :comment, :image, :image_cache)
    end

end
