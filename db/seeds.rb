user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")
user3 = User.where(email: "test3@example.com").first_or_create(password: "password", password_confirmation: "password")

apartment1 = [
    {
        street: '1026 york st', 
        unit: 'A',
        city: 'vallejo',
        state: 'CA',
        square_footage: 2000,
        price: '$3000',
        bedrooms: 4,
        bathrooms: 2,
        pets: 'yes',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg40Psu9oCDZMyXyQYcdzxW0OarFjElUqjKQ&usqp=CAU'
    },
    {
        street: '537 Avian way', 
        unit: '1',
        city: 'St Canard',
        state: 'CA',
        square_footage: 3500,
        price: '$3000',
        bedrooms: 4,
        bathrooms: 3,
        pets: 'yes',
        image: 'https://64.media.tumblr.com/e42ca95116010310891d3affc8017f4d/tumblr_inline_pbou2aDq7K1rx2ks6_500.jpg'
    }
]

apartment2 = [
    {
        street: '666 Arkham Asylum way', 
        unit: 'cell A',
        city: 'Gotham',
        state: 'NY',
        square_footage: 50,
        price: 'free',
        bedrooms: 1,
        bathrooms: .5,
        pets: 'just rats',
        image: 'https://upload.wikimedia.org/wikipedia/commons/4/45/Asylum_Buildings_%288136405492%29.jpg'
    },
    {
        street: '666 Arkham Asylum way', 
        unit: 'cell B',
        city: 'Gotham',
        state: 'NY',
        square_footage: 50,
        price: 'free',
        bedrooms: 1,
        bathrooms: .5,
        pets: 'just rats',
        image: 'https://upload.wikimedia.org/wikipedia/commons/4/45/Asylum_Buildings_%288136405492%29.jpg'
    }
]

apartment3 = [
    {
        street: '42 Fenton Way', 
        unit: '1',
        city: 'Amity Park',
        state: 'Ohio',
        square_footage: 2500,
        price: '$3500',
        bedrooms:4 ,
        bathrooms: 3,
        pets: 'yes',
        image: 'https://www.thehousedesigners.com/images/plans/01/URD/bulk/6583/the-destination-front-rendering_m.webp'
    },
    {
        street: '42 Fenton Way', 
        unit: 'ghost zone',
        city: 'Amity Park',
        state: 'Ohio',
        square_footage: 10000000,
        price: '1 soul',
        bedrooms: 1,
        bathrooms: 1,
        pets: 'ghost pets only',
        image: 'https://static.wikia.nocookie.net/5yl/images/8/8b/Ghost_Zone-0.png/revision/latest?cb=20200102213915'
    }
]
apt1.each do |apartment|
    user1.apartments.create(apartment)
    p "creating #{apartment}"
  end
  apt2.each do |apartment|
    user2.apartments.create(apartment)
    p "creating #{apartment}"
  end
  apt3.each do |apartment|
    user3.apartments.create(apartment)
    p "creating #{apartment}"
  end
  