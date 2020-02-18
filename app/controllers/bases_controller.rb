class BasesController < ApplicationController
  before_action :set_base, only: [:edit, :update, :destroy]
  
  def index
    @bases = Base.all
  end
  
  def new
    @base = Base.new
    @user = @base
  end
  
  def create
    @base = Base.new(base_params)
    @user = @base
    if @base.save
      flash[:success] = "新規拠点を作成しました。"
      redirect_to bases_url
    else
      render :new
    end
  end
  
  def edit
    @user = @base
  end 
  
  def update
    @base = Base.find(params[:id])
    @user = @base
    if @base.update_attributes(base_params)
      flash[:success] = "拠点情報を更新しました。"
      redirect_to bases_url
    else
      render :edit
    end
  end
  
  def destroy
    @user = @base
    @base.destroy
    flash[:success] = "拠点情報を削除しました。"
    redirect_to bases_url
  end
  
  
  def set_base
    @base = Base.find(params[:id])
  end
  
    private
    
    def base_params
      params.require(:base).permit(:name, :number, :bases_type)
    end
   
end
