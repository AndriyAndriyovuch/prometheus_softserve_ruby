require 'faker'

5.times do |num|
  user = User.create(
    email: "test#{num + 1}@test.com",
    password: "qwerty",
    created_at: Time.now,
    updated_at: Time.now,
    locale: 'en'
  )

end

cats = { 'House' => 'Things to my home',
         'Beer' => 'Favourite alcohol',
         'Internet' => 'Payment in web',
         'Restaurants' => 'Business lunch',
         'Games' => "Games on PC",
         'Coffee' => "Just to wake up",
         'Music' => 'Outlays to keep my menthal health',
         'Business' => 'Income from my skateshop',
         'Work' => 'My  freelance salary'

}

5.times do |num|
  cats.each do |cat_name, cat_desc|
    cat = Category.create(
      name: cat_name,
      description: cat_desc,
      created_at: Time.now,
      updated_at: Time.now,
      user_id: User.find_by(email: "test#{num + 1}@test.com").id,
    )

  end
end

# House operations
rand(30..50).times do
  operation = Operation.create(
    amount: rand(5..1000),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::House.furniture}",
    category_id: 1,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test#{rand(1..5)}@test.com").id,
    income: false
  )

end

# Beer operations
rand(30..50).times do
  operation = Operation.create(
    amount: rand(5..100),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Beer.name}",
    category_id: 2,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test#{rand(1..5)}@test.com").id,
    income: false
  )

end

# Internet operations
rand(30..50).times do
  operation = Operation.create(
    amount: rand(100..500),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "Buy on #{Faker::Internet.domain_name}",
    category_id: 3,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test#{rand(1..5)}@test.com").id,
    income: false
  )

end

# Restaurants operations
rand(30..50).times do
  operation = Operation.create(
    amount: rand(50..200),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Food.description}",
    category_id: 4,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test#{rand(1..5)}@test.com").id,
    income: false
  )

end

# Games operations
rand(30..50).times do
  operation = Operation.create(
    amount: rand(100..1000),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Game.title}",
    category_id: 5,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test#{rand(1..5)}@test.com").id,
    income: false
  )

end

# Coffee operations
rand(30..50).times do
  operation = Operation.create(
    amount: rand(20..300),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Coffee.blend_name}",
    category_id: 6,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test#{rand(1..5)}@test.com").id,
    income: false
  )

end

# Music operations
rand(30..50).times do
  operation = Operation.create(
    amount: rand(20..300),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Music.album}",
    category_id: 7,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test#{rand(1..5)}@test.com").id,
    income: false
  )

end

# Business income operations
rand(30..50).times do
  operation = Operation.create(
    amount: rand(1..1500),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "From #{Faker::Business.credit_card_number}",
    category_id: 8,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test#{rand(1..5)}@test.com").id,
    income: true
  )

end

# Work income operations
rand(30..50).times do
  operation = Operation.create(
    amount: rand(1000..4500),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "From #{Faker::Business.credit_card_number}",
    category_id: 9,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test#{rand(1..5)}@test.com").id,
    income: true
  )

end
