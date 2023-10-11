require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# spec/models/product_spec.rb

# spec/models/product_spec.rb


RSpec.describe Product, type: :model do
  describe 'validations' do
    let(:category) { Category.create(name: 'Test Category') }

    it 'saves successfully when all fields are set' do
      product = Product.new(
        name: 'Sample Product',
        description: 'A sample product',
        price: 19.99,
        category: category
      )
      expect(product).to be_valid
      expect(product.save).to be_truthy
    end

    it 'validates the presence of name' do
      product = Product.new(
        name: nil,
        description: 'A sample product',
        price: 19.99,
        category: category
      )
      expect(product).not_to be_valid
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'validates the presence of description' do
      product = Product.new(
        name: 'Sample Product',
        description: nil,
        price: 19.99,
        category: category
      )
      expect(product).not_to be_valid
      expect(product.errors[:description]).to include("can't be blank")
    end

    it 'validates the presence of price' do
      product = Product.new(
        name: 'Sample Product',
        description: 'A sample product',
        price: nil,
        category: category
      )
      expect(product).not_to be_valid
      expect(product.errors[:price]).to include("can't be blank")
    end

    it 'validates that price is a number' do
      product = Product.new(
        name: 'Sample Product',
        description: 'A sample product',
        price: 'not_a_number',
        category: category
      )
      expect(product).not_to be_valid
      expect(product.errors[:price]).to include('is not a number')
    end
  end
end
