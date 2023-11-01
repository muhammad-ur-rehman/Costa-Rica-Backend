module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :menus, [MenuType], null: false, description: 'List of all menus' do
      argument :sort_by_price, Boolean, required: false, default_value: false
    end

    field :search_menus, [MenuType], null: false, description: 'Search for menus by name' do
      argument :name, String, required: true
    end

    def menus(sort_by_price: false)
      menus = Menu.all
      menus = menus.order(price: :desc) if sort_by_price
      menus
    end

    def search_menus(name:)
      Menu.where('name ILIKE :name', name: "%#{name.squish}%")
    end
  end
end
