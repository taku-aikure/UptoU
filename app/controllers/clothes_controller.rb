class ClothesController < ApplicationController
  before_action :set_clothe, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @clothes = Clothe.all
    @search = Clothe.ransack(params[:q])
    @clothes = @search.result
  end

  def new
    @clothe = Clothe.new
  end

  def create
    @clothe = Clothe.new(clothe_params)
    if @clothe.save
      redirect_to clothes_path
    else
      render :new
    end
  end

    def show
    end

    def edit
    end

    def update
      if @clothe.update(clothe_without_image)
        redirect_to clothe_path
      else
        render :edit
    end
  end


    def destroy
      @clothe.destroy
      redirect_to clothes_path
    end


  private

  def clothe_params
    params.require(:clothe).permit(:description, :category_id, :image ).merge(user_id: current_user.id)
  end

  def clothe_without_image
    params.require(:clothe).permit(:description, :category_id).merge(user_id: current_user.id)
  end

  def set_clothe
    @clothe = Clothe.find(params[:id])
  end

  def move_to_root
    redirect_to root_path unless current_user.id == @clothe.user_id
  end

  
end

