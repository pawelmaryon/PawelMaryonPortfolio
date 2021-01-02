class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
    @page_title = 'My Portfolio'
  end

  def react
    @react_portfolio_items = Portfolio.react
  end

  def ruby_on_rails
    @ruby_on_rails_portfolio_items = Portfolio.ruby_on_rails_portfolio_items
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
    @page_title = @portfolio_item.title
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to @portfolio_item, notice: 'Portfolio item was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save

        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }

        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio item was removed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:name])
  end
end
