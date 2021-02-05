class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => MY_USER, :password => MY_PASS
  def show
    @productcount = Product.count
    @categories = Category.count
  end
end
