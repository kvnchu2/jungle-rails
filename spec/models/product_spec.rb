require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should have a name' do 
      cat1 = Category.new( name: 'Apparel')
      @product = Product.new(name: "ken", price: 300, quantity: 5, category: cat1)
      @product.save!
      expect(@product.name).to be_present
    end

    it 'should have a price' do
      cat1 = Category.new( name: 'Apparel')
      @product = Product.new(name: "ken", price: 300, quantity: 5, category: cat1)
      @product.save!
      expect(@product.price).to be_present
    end

    it 'should have a quantity' do
      cat1 = Category.new( name: 'Apparel')
      @product = Product.new(name: "ken", price: 300, quantity: 5, category: cat1)
      @product.save!
      expect(@product.quantity).to be_present
    end

    it 'should have a category' do
      cat1 = Category.new( name: 'Apparel')
      @product = Product.new(name: "ken", price: 300, quantity: 5, category: cat1)
      @product.save!
      expect(@product.category).to be_present
    end

    it 'should show error when name is empty' do
      cat1 = Category.new( name: 'Apparel')
      @product = Product.new(price: 300, quantity: 5, category: cat1)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
      # expect(@product.errors.messages[:name]).to be_present
    end
  end
end



# describe '#id' do
#   it 'should not exist for new records' do
#     @widget = Widget.new
#     expect(@widget.id).to be_nil
#   end

#   it 'should be auto-assigned by AR for saved records' do
#     @widget = Widget.new
#     # we use bang here b/c we want our spec to fail if save fails (due to validations)
#     # we are not testing for successful save so we have to assume it will be successful
#     @widget.save!

#     expect(@widget.id).to be_present
#   end
# end

