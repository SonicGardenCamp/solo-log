def random_true_false
  truth_value = true
  rand(5).times{|_| truth_value = !(truth_value)}
  truth_value
end

def give_review
  rand(1..5)
end

users = []
10.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    confirmed_at: Time.now
  )
end
10.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
end

20.times do
  shop = Shop.new(latitude: Faker::Address.latitude.ceil(6),
                  longitude: Faker::Address.longitude.ceil(6),
                  address: Faker::Address.full_address,
                  name: Faker::Lorem.sentence,
                  genre: Faker::Food.ethnic_category)
  shop.save!
end

Shop.all.each do |shop|
  10.times do
    shop.reviews.build(rate: rand(1..5), comment: Faker::Lorem.paragraph(sentence_count: 4),
                        exist_counter_sheets: random_true_false,
                        frequent_solo_visitors: give_review,
                        exist_solo_tables: random_true_false,
                        easy_to_order: give_review,
                        delivery_speed: give_review,
                        calmness: give_review)
    shop.save!
  end
end
