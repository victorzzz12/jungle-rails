require 'rails_helper'

RSpec.feature "User clicks 'Add to Cart' and cart shows 1", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
        )
    end
  end

  scenario "Cart increases from 0 to 1" do
    # ACT
    visit root_path
    first('.product').click_button('Add')
    # DEBUG /
    expect(page).to have_text 'My Cart (1)'
    save_screenshot

  end

end