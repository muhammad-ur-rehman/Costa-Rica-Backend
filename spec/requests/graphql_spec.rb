require 'rails_helper'

RSpec.describe 'GraphQL queries and mutations' do
  describe 'menus query' do
    it 'returns a list of menus' do
      menu = create(:menu)
      post '/graphql', params: { query: '{ menus { name } }' }

      json_response = JSON.parse(response.body)

      expect(json_response['data']['menus']).to be_an(Array)
      expect(json_response['data']['menus'][0]['name']).to eq(menu.name)
    end

    it 'returns a sorted list of menus by price' do
      create(:menu, name: 'Pizza A', price: 10.0)
      create(:menu, name: 'Pizza B', price: 5.0)
      post '/graphql', params: { query: '{ menus(sortByPrice: true) { name } }' }
      json_response = JSON.parse(response.body)

      expect(json_response['data']['menus'][0]['name']).to eq('Pizza A')
    end
  end

  describe 'search_menus query' do
    # rubocop:disable RSpec/ExampleLength
    it 'returns menus with a matching name' do
      create(:menu, name: 'Margherita Pizza')
      create(:menu, name: 'Pepperoni Pizza')
      post '/graphql', params: { query: '{ searchMenus(name: "Margherita") { name } }' }
      json_response = JSON.parse(response.body)

      expect(json_response['data']['searchMenus'].size).to eq(1)
      expect(json_response['data']['searchMenus'][0]['name']).to eq('Margherita Pizza')
    end
    # rubocop:enable RSpec/ExampleLength
  end
end
