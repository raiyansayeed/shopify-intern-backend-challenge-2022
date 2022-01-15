# require "rails_helper"
require "test_helper"

class RackAttackTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    setup_rack_attack_cache_store
    avoid_test_overlaps_in_cache
  end

  def setup_rack_attack_cache_store
    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  end

  def avoid_test_overlaps_in_cache
    Rails.cache.clear
  end

  test "throttles all requests to site" do
    ip = "1.2.3.4"

    100.times do 
      get '/', headers: { REMOTE_ADDR: ip }
    end

    assert_response :too_many_requests
  end

  test "throttle excessive requests to new products by IP address" do
    limit = 300
    period = 300
    ip = "1.2.3.4"
    limit.times do
      Rack::Attack.cache.count("requests/ip:#{ip}", period)
    end

    20.times do 
      post "/products", headers: { REMOTE_ADDR: ip }, params: { product: { name: "Hi" } }
    end

    assert_response :too_many_requests
  end
end
