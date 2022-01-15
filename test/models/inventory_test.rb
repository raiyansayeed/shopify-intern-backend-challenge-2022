require "test_helper"

class InventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @product = products(:one)
  end

  test "is proper" do 
    inventory = Inventory.new(
      kind: 'a',
      price: 10,
      quantity: 10,
      product: @product
    )
    assert inventory.valid?
  end

  test "kind is not > 100 chars" do
    inventory = Inventory.new(
      kind: 'a' * 101,
      price: 10,
      quantity: 10,
      product: @product
    )
    assert inventory.invalid?
  end

  test "kind is valid with 100 chars" do 
    inventory = Inventory.new(
      kind: 'a' * 100,
      price: 10,
      quantity: 10,
      product: @product
    )
    assert inventory.valid?
  end

  test "kind exists" do
    inventory = Inventory.new(
      price: 10,
      quantity: 10,
      product: @product
    )
    assert inventory.invalid?
  end

  test "price is not negative" do
    inventory = Inventory.new(
      kind: 'a',
      price: -10,
      quantity: 10,
      product: @product
    )
    assert inventory.invalid?
  end

  test "price exists" do
    inventory = Inventory.new(
      kind: 'a',
      quantity: 10,
      product: @product
    )
    assert inventory.invalid?
  end

  test "quantity is not negative" do
    inventory = Inventory.new(
      kind: 'a',
      price: 10,
      quantity: -10,
      product: @product
    )
    assert inventory.invalid?
  end

  test "quantity is an integer" do
    inventory = Inventory.new(
      kind: 'a',
      price: 10,
      quantity: 10.5,
      product: @product
    )
    assert inventory.invalid?
  end

  test "quantity exists" do 
    inventory = Inventory.new(
      kind: 'a' * 101,
      price: 10,
      product: @product
    )
    assert inventory.invalid?
  end
end
