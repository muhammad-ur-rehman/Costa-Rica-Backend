require 'rails_helper'

RSpec.describe Menu do
  context 'when validations' do
    it 'is valid with valid attributes' do
      menu = build(:menu)
      expect(menu).to be_valid
    end

    it 'is not valid without a category' do
      menu = build(:menu, category: nil)
      expect(menu).not_to be_valid
    end

    it 'is not valid if the category exceeds 255 characters' do
      category = 'a' * 256
      menu = build(:menu, category: category)
      expect(menu).not_to be_valid
    end

    it 'is not valid without a name' do
      menu = build(:menu, name: nil)
      expect(menu).not_to be_valid
    end

    it 'is not valid if the name exceeds 255 characters' do
      name = 'a' * 256
      menu = build(:menu, name: name)
      expect(menu).not_to be_valid
    end

    it 'is not valid if the name is not unique' do
      create(:menu, name: 'Margherita')
      menu = build(:menu, name: 'Margherita')
      expect(menu).not_to be_valid
    end

    it 'is not valid without a price' do
      menu = build(:menu, price: nil)
      expect(menu).not_to be_valid
    end

    it 'is not valid if the price is negative' do
      menu = build(:menu, price: -5)
      expect(menu).not_to be_valid
    end
  end

  context 'when creation' do
    it 'can be created' do
      menu = create(:menu)
      expect(menu).to be_valid
    end
  end

  context 'when update' do
    it 'can be updated' do
      menu = create(:menu)
      updated_name = 'Updated Pizza'
      menu.update(name: updated_name)
      expect(menu.name).to eq(updated_name)
    end
  end

  context 'when deletion' do
    it 'can be deleted' do
      menu = create(:menu)
      menu.destroy
      expect(described_class.exists?(menu.id)).to be false
    end
  end
end
