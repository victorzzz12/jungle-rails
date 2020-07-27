require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    product = Product.new()
    category = Category.new()

    it 'is not valid without a name' do 
      product.price = 10
      product.quantity = 100
      product.category_id = 1
      expect(product).to_not be_valid
    end

    it 'is not valid without a price' do
      product.name = "peach"
      product.quantity = 10
      product.category_id = 1
      expect(product).to_not be_valid
    end

    it 'is not valid without a quantity' do
      product.name = "apple"
      product.category_id = 1
      product.price = 10000
      expect(product).to_not be_valid
    end

    it 'is not valid without a category' do
      product.name = 'pear'
      product.quantity = 3
      product.price = 10000
      expect(product).to_not be_valid
    end

  end
end