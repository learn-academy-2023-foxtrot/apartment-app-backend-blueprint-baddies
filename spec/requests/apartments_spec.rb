require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password'
  )
  }

  describe "GET /index" do
    it 'gets a list of apartments' do
      apartment = user.apartments.create(
        street: '4 Privet Drive',
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
      get '/apartments'

      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.first['street']).to eq('4 Privet Drive')
    end
  end

  describe "POST /create" do
    it "creates a apartment" do
      apartment_params = {
        apartment: {
          street: '4 Privet Drive',
          unit: '2A',
          city: 'Little Whinging',
          state: 'Surrey',
          square_footage: 2000,
          price: '2000',
          bedrooms: 3,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      p 'response', response
      expect(response).to have_http_status(200)
      apartment = Apartment.first
      expect(apartment.street).to eq('4 Privet Drive')
    end
    it 'checks for a street' do
      apartment_params = {
        apartment: {
          unit: '2A',
          city: 'Little Whinging',
          state: 'Surrey',
          square_footage: 2000,
          price: '2000',
          bedrooms: 3,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      expect(response.status).to eq 422
      apartment_error = JSON.parse(response.body)
      expect(apartment_error['street']).to include("can't be blank")
    end
    it 'checks for  a unit' do
      apartment_params = {
        apartment: {
          street: '2A',
          city: 'Little Whinging',
          state: 'Surrey',
          square_footage: 2000,
          price: '2000',
          bedrooms: 3,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      p "response", response
      expect(response.status).to eq 422
      apartment_error = JSON.parse(response.body)
      expect(apartment_error['unit']).to include("can't be blank")
    end
    it 'checks for  a city' do
      apartment_params = {
        apartment: {
          street: '2A',
          unit: 'Little Whinging',
          state: 'Surrey',
          square_footage: 2000,
          price: '2000',
          bedrooms: 3,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      p "response", response
      expect(response.status).to eq 422
      apartment_error = JSON.parse(response.body)
      expect(apartment_error['city']).to include("can't be blank")
    end
    it 'checks for  a state' do
      apartment_params = {
        apartment: {
          street: '2A',
          unit: 'Little Whinging',
          city: 'Surrey',
          square_footage: 2000,
          price: '2000',
          bedrooms: 3,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      p "response", response
      expect(response.status).to eq 422
      apartment_error = JSON.parse(response.body)
      expect(apartment_error['state']).to include("can't be blank")
    end
    it 'checks for square_footage' do
      apartment_params = {
        apartment: {
          street: '2A',
          unit: 'Little Whinging',
          state: 'Surrey',
          city: "2000",
          price: '2000',
          bedrooms: 3,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      p "response", response
      expect(response.status).to eq 422
      apartment_error = JSON.parse(response.body)
      expect(apartment_error['square_footage']).to include("can't be blank")
    end
    it 'checks for price' do
      apartment_params = {
        apartment: {
          street: '2A',
          unit: 'Little Whinging',
          state: 'Surrey',
          city: "2000",
          square_footage: 2000,
          bedrooms: 3,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      p "response", response
      expect(response.status).to eq 422
      apartment_error = JSON.parse(response.body)
      expect(apartment_error['price']).to include("can't be blank")
    end
    it 'checks for bedrooms' do
      apartment_params = {
        apartment: {
          street: '2A',
          unit: 'Little Whinging',
          state: 'Surrey',
          city: "2000",
          square_footage: 2000,
          price:' 3',
          bathrooms: 2,
          pets: 'yes',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      p "response", response
      expect(response.status).to eq 422
      apartment_error = JSON.parse(response.body)
      expect(apartment_error['bedrooms']).to include("can't be blank")
    end
    it 'checks for bathrooms' do
      apartment_params = {
        apartment: {
          street: '2A',
          unit: 'Little Whinging',
          state: 'Surrey',
          city: "2000",
          square_footage: 2000,
          price:' 3',
          bedrooms: 2,
          pets: 'yes',
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      p "response", response
      expect(response.status).to eq 422
      apartment_error = JSON.parse(response.body)
      expect(apartment_error['bathrooms']).to include("can't be blank")
    end
    it 'checks for pets' do
      apartment_params = {
        apartment: {
          street: '2A',
          unit: 'Little Whinging',
          state: 'Surrey',
          city: "2000",
          square_footage: 2000,
          price:' 3',
          bedrooms: 2,
          bathrooms: 2,
          image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      p "response", response
      expect(response.status).to eq 422
      apartment_error = JSON.parse(response.body)
      expect(apartment_error['pets']).to include("can't be blank")
    end
    it 'checks for image' do
      apartment_params = {
        apartment: {
          street: '2A',
          unit: 'Little Whinging',
          state: 'Surrey',
          city: "2000",
          square_footage: 2000,
          price:' 3',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      p "response", response
      expect(response.status).to eq 422
      apartment_error = JSON.parse(response.body)
      expect(apartment_error['image']).to include("can't be blank")
    end
    it 'checks for user_id' do
      apartment_params = {
        apartment: {
          street: '2A',
          unit: 'Little Whinging',
          state: 'Surrey',
          city: "2000",
          square_footage: 2000,
          price:' 3',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
          image: 'user.id'
        }
      }
      post '/apartments', params: apartment_params
      p "response", response
      expect(response.status).to eq 422
      apartment_error = JSON.parse(response.body)
      expect(apartment_error['user_id']).to include("can't be blank")
    end
  end
end