require 'faker'

1.times do |num|
  User.create(
    email: "test1@test.com",
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

1.times do |num|
  cats.each do |cat_name, cat_desc|
    Category.create(
      name: cat_name,
      description: cat_desc,
      created_at: Time.now,
      updated_at: Time.now,
      user_id: User.find_by(email: "test1@test.com").id,
    )

  end
end

# House operations
rand(30..50).times do
  Operation.create(
    amount: rand(5..1000),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::House.furniture}",
    category_id: Category.find_by(name: 'House').id,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test1@test.com").id,
    income: false
  )

end

# Beer operations
rand(30..50).times do
  Operation.create(
    amount: rand(5..100),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Beer.name}",
    category_id: Category.find_by(name: 'Beer').id,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test1@test.com").id,
    income: false
  )

end

# Internet operations
rand(30..50).times do
  Operation.create(
    amount: rand(100..500),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "Buy on #{Faker::Internet.domain_name}",
    category_id: Category.find_by(name: 'Internet').id,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test1@test.com").id,
    income: false
  )

end

# Restaurants operations
rand(30..50).times do
  Operation.create(
    amount: rand(50..200),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Food.description}",
    category_id: Category.find_by(name: 'Restaurants').id,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test1@test.com").id,
    income: false
  )

end

# Games operations
rand(30..50).times do
  Operation.create(
    amount: rand(100..1000),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Game.title}",
    category_id: Category.find_by(name: 'Games').id,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test1@test.com").id,
    income: false
  )

end

# Coffee operations
rand(30..50).times do
  Operation.create(
    amount: rand(20..300),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Coffee.blend_name}",
    category_id: Category.find_by(name: 'Coffee').id,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test1@test.com").id,
    income: false
  )

end

# Music operations
rand(30..50).times do
  Operation.create(
    amount: rand(20..300),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Music.album}",
    category_id: Category.find_by(name: 'Music').id,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test1@test.com").id,
    income: false
  )

end

# Business income operations
rand(30..50).times do
  Operation.create(
    amount: rand(1..1500),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "From #{Faker::Business.credit_card_number}",
    category_id: Category.find_by(name: 'Business').id,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test1@test.com").id,
    income: true
  )

end

# Work income operations
rand(30..50).times do
  Operation.create(
    amount: rand(1000..4500),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "From #{Faker::Business.credit_card_number}",
    category_id: Category.find_by(name: 'Work').id,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: User.find_by(email: "test1@test.com").id,
    income: true
  )

end
