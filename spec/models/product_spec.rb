require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @product = Product.new(
      name: 'abs',
      price_cents: 12321,
      quantity: 1
    )
    byebug
    @product.category = Category.new

  end

  describe 'Validations' do
    it 'should require a product name' do
      @product.name = nil
      expect(@product).to be_invalid
    end

    it 'should require a price' do
      @product.price_cents = nil
      expect(@product).to be_invalid
    end

    it 'should require a quantity' do
      @product.quantity = nil
      expect(@product).to be_invalid
    end

    it 'should be under a category' do
      @product.category = nil
      expect(@product).to be_invalid
    end
  end
  #   validates :name, presence: true
  #   validates :price, presence: true
  #   validates :quantity, presence: true
  #   validates :category, presence: true
end
