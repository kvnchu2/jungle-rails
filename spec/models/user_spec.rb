require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: "kevin", email: "kevin@gmail.com", password:"skyblue", password_confirmation:"skyblue")
    @user.save!
  end
  describe 'validations' do
    it 'should have a name' do
      @user = User.new(name: "kevin", email: "john@gmail.com", password:"skyblue", password_confirmation:"skyblue")
      @user.save!
      expect(@user.name).to be_present
    end

    it 'should have an email' do
      @user = User.new(name: "kevin", email: "john@gmail.com", password:"skyblue", password_confirmation:"skyblue")
      @user.save!
      expect(@user.email).to be_present
    end

    it 'should have a password' do
      @user = User.new(name: "kevin", email: "john@gmail.com", password:"skyblue", password_confirmation:"skyblue")
      @user.save!
      expect(@user.password).to be_present
    end

    it 'should have a password_confirmation' do
      @user = User.new(name: "kevin", email: "john@gmail.com", password:"skyblue", password_confirmation:"skyblue")
      @user.save!
      expect(@user.password_confirmation).to be_present
    end

    it 'should fail if password and password_confirmation are not the same' do
      @user = User.new(name: "kevin", email: "john@gmail.com", password:"skyblue", password_confirmation:"skyblues")
      expect{@user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should fail if email is already in the database' do
      
      @user1 = User.new(name: "kevin", email: "kevin@gmail.com", password:"skyblue", password_confirmation:"skyblue")
      expect{@user1.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should fail if password is not 6 characters' do
      
      @user1 = User.new(name: "kevin", email: "john@gmail.com", password:"skyb", password_confirmation:"skyb")
      expect{@user1.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end


  describe '.authenticate_with_credentials' do
    # examples for this class method here
    

    it 'should authenticate with correct email and password' do
    user = User.authenticate_with_credentials("kevin@gmail.com", "skyblue")
    expect(user).to be_truthy
      
    end

    it 'should not authenticate with incorrect email and password' do
      user = User.authenticate_with_credentials("john@gmail.com", "skyblue")
      expect(user).to be_nil
        
    end
    
    it 'should authenticate with spaces before or after email' do
      user = User.authenticate_with_credentials("   kevin@gmail.com ", "skyblue")
      expect(user).to be_truthy
        
    end

    it 'should authenticate with case insensitivity' do
      user = User.authenticate_with_credentials("   keviN@gmail.com ", "skyblue")
      expect(user).to be_truthy
        
    end

  end
end



# :name, :email, :password, :password_confirmation

# it 'should show error when name is empty' do
#   cat1 = Category.new( name: 'Apparel')
#   @product = Product.new(price: 300, quantity: 5, category: cat1)
#   expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
#   # expect(@product.errors.messages[:name]).to be_present
# end