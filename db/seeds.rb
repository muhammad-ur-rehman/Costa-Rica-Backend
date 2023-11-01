
50.times do
  name = Faker::Food.dish
  category = Faker::Food.ingredient
  price = rand(5.99..20.99).round(2)

  Menu.create(name: name, category: category, price: price)
end
