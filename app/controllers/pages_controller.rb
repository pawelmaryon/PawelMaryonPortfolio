class PagesController < ApplicationController
  layout 'page'
  def home
    @posts = Blog.all
    @skills = Skill.all
    @portfolio = Portfolio.all
  end

  def about
  end

  def contact
  end

  def portfolio
  end
end
