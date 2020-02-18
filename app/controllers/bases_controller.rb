class BasesController < ApplicationController
  def index
    @bases = Base.all
  end
  
  def new
    @base = Base.new
  end
  
  def create
    @user = User.new(base_params)
    if @base.save
      flash[:success] = "新規拠点を作成しました。"
      redirect_to bases_url
    else
      render :new
    end
  end
  
  def edit
  end 
  
  def update
  end
  
  def destroy
  end
  
  
  def set_base
    @base = Base.find(params[:id])
  end
  
    private
    
    def base_params
      params.require(:base).permit(:name, :number, :bases_type)
    end
   
end
