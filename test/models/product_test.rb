require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @seller = sellers(:one)
  end

  test "is valid" do 
    product = Product.new(
      description: "The coolest figurine",
      name: "Star Platinum",
      seller: @seller
    )

    assert product.valid?
  end

  test "has a seller" do
    product = Product.new(
      description: "The coolest figurine",
      name: "Star Platinum",
    )

    assert product.invalid?
  end

  test "name is not greater than 100 chars" do 
    product = Product.new(
      description: "The coolest figurine",
      name: "Star Platinum" * 200,
      seller: @seller
    )

    assert product.invalid?
  end

  test "name is valid with 100 chars" do 
    product = Product.new(
      description: "The coolest figurine",
      name: "a"*100,
      seller: @seller
    )

    assert product.valid?
  end

  test "description is not greater than 500 chars" do 
    product = Product.new(
      description: "a" * 501,
      name: "Star Platinum",
      seller: @seller
    )

    assert product.invalid?
  end

  test "description is valid with 500 chars" do 
    product = Product.new(
      description: "a" * 500,
      name: "Star Platinum",
      seller: @seller
    )

    assert product.valid?
  end
end
