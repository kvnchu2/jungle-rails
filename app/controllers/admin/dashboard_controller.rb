class Admin::DashboardController < ApplicationController
  def show
    @productcount = Product.count
    @categories = Category.count
  end
end
