class MoneysController < ApplicationController
  def index
    @moneys = Money.all
  end

  def add
    money_total = 0
    
    if request.post? then
      Money.create(money_params)
      goback
    else
      @money = Money.new
    end 
  end

  def edit
    @money = Money.find(params[:id])
    if request.patch? then
      @money.update(money_params)
      goback
    end
  end

  def delete
    Money.find(params[:id]).destroy
    goback
  end

  private
  def money_params
    params.require(:money).permit(:date, :item, :price, :category, :memo)
  end

  def goback
    redirect_to '/moneys'
  end

end
