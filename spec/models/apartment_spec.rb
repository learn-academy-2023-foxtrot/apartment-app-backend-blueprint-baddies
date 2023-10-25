
require "rails_helper"


RSpec.describe Apartment, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validate street' do
    apartment = user.apartments.create(
      unit: '2A',
      city: 'Little Whinging',
      state: 'Surrey',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(apartment.errors[:street]).to include("can't be blank")
  end
  it 'should validate unit' do
    apartment = user.apartments.create(
      street: '575 huh st',
      city: 'Little Whinging',
      state: 'Surrey',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(apartment.errors[:unit]).to include("can't be blank")
  end
  it 'should validate city' do
    apartment = user.apartments.create(
      unit: '2A',
      street: 'Little Whinging',
      state: 'Surrey',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(apartment.errors[:city]).to include("can't be blank")
  end
  it 'should validate state' do
    apartment = user.apartments.create(
      unit: '2A',
      city: 'Little Whinging',
      street: 'Surrey',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(apartment.errors[:state]).to include("can't be blank")
  end
  it 'should validate square_footage' do
    apartment = user.apartments.create(
      unit: '2A',
      city: 'Little Whinging',
      state: 'Surrey',
      street: '2000',
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(apartment.errors[:square_footage]).to include("can't be blank")
  end
  it 'should validate price' do
    apartment = user.apartments.create(
      unit: '2A',
      city: 'Little Whinging',
      state: 'Surrey',
      square_footage: 2000,
      street: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(apartment.errors[:price]).to include("can't be blank")
  end
  it 'should validate bedrooms' do
    apartment = user.apartments.create(
      unit: '2A',
      city: 'Little Whinging',
      state: 'Surrey',
      square_footage: 2000,
      price: '2000',
      street: '3',
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(apartment.errors[:bedrooms]).to include("can't be blank")
  end
  it 'should validate bathrooms' do
    apartment = user.apartments.create(
      unit: '2A',
      city: 'Little Whinging',
      state: 'Surrey',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      street: '2',
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(apartment.errors[:bathrooms]).to include("can't be blank")
  end
  it 'should validate pets' do
    apartment = user.apartments.create(
      unit: '2A',
      city: 'Little Whinging',
      state: 'Surrey',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      street: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(apartment.errors[:pets]).to include("can't be blank")
  end
  it 'should validate image' do
    apartment = user.apartments.create(
      unit: '2A',
      city: 'Little Whinging',
      state: 'Surrey',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      street: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(apartment.errors[:image]).to include("can't be blank")
  end
end