class HousesController < ApplicationController
  def index
    words = params[:q].delete(:search_words) if params[:q].present?
  if words.present?
    params[:q][:groupings] = []
    words.split(/[ 　]/).each_with_index do |word, i| #全角空白と半角空白で切って、単語ごとに処理します
      params[:q][:groupings][i] = { name_or_address_or_station_cont: word }
    end
  end
    #@houses = House.all
    @search = House.ransack(params[:q])
    @houses = @search.result(distinct: true)
    
  end
  
  def new
    @house = House.new
  end
  
  def create
    @house = House.new(house_params)
    @house.owner_id = current_owner.id
    if @house.save
      redirect_to houses_path
    else
      render 'new'
    end
  end
  
  def show
    @house = House.find(params[:id])
    @price = Price.find_by(adress: @house.adress)
  end
  
  def edit
    @house = House.find(params[:id])
  end
  
  def update
    @house = House.find(params[:id])
    if @house.update(house_params)
      redirect_to houses_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to houses_path
  end

  private
  
  def house_params
    params.require(:house).permit(:name,:station,:deposit,:key,:floor,:money,:comment,:adress, [:image])
  end  
end
