require "test_helper"

class SellerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "is valid" do 
    seller = Seller.new(
      name: "Hirohiko Araki"
    )

    assert seller.valid?
  end

  test "name is not greater than 100 chars" do
    seller = Seller.new(
      name: "H" * 101
    ) 

    assert seller.invalid?
  end

  test "name is <= 100" do 
    seller = Seller.new(
      name: "H" * 10
    ) 

    assert seller.valid?
  end
end
