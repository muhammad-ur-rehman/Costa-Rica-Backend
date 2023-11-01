# spec/factories/menus.rb
FactoryBot.define do
  factory :menu do
    category { 'Pizza' }
    name { 'Margherita' }
    price { 9.99 }
  end
end
