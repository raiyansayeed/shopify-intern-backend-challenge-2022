# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sellers = []

5.times do
    sellers << Seller.create(name: Faker::Company.name)
end

sellers.each do |s|

    # upto 40 products per seller 
    Random.rand(30..40).times do
        product = s.products.build(
            name: "#{Faker::Commerce.brand} #{Faker::Commerce.product_name}",
            description: "#{Faker::Company.buzzword} by #{Faker::Company.name}"
        )
        product.save
        # byebug
        # up to 4 different types of products
        Random.rand(1..4).times do
            product.inventories.build(
                quantity: Random.rand(0..10),
                price: Faker::Commerce.price(range: 0..30.0),
                kind: Faker::Commerce.color,
            )
        end
        product.save
    end

end

# sellers.each do |s|
#     s.save
# end
