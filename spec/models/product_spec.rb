require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    #Happy path!! Everything is good
    it 'is valid when all fields are filled out' do
      product = Product.new(
        name: 'Example Product',
        price: 10,
        quantity: 5,
        category: Category.new
      )

      expect(product.valid?).to be_truthy
    end

    it 'validates presence of name' do
      product = Product.new(price: 10, quantity: 5, category: Category.new)

      # Test the false path first (No name) which should be required by our model
      expect(product.valid?).to be_falsey
      expect(product.errors[:name]).to include("can't be blank")

      # Test after valid name
      product.name = 'Example Product'
      expect(product.valid?).to be_truthy
    end

  end  
end
