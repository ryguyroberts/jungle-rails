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

  end  
end
