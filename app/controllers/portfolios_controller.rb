class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to @portfolio_item, notice: 'portfolio_item was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  #   def portfolio_params
  #     params.require(:portfolio_item).permit(
  #       :title,
  #       :subtitle,
  #       :body,
  #       :main_image,
  #       :thumb_image
  #     )
  #   end
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
