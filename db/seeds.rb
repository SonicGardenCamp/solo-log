def random_true_false
  truth_value = true
  rand(5).times{|_| truth_value = !(truth_value)}
  truth_value
end

def give_review
  rand(1..5)
end

# 日本の範囲内のランダムな緯度と経度を生成するメソッド
def random_coordinates_in_japan
  # 日本の緯度範囲（南端から北端まで）
  min_latitude = 24.396308
  max_latitude = 45.551483

  # 日本の経度範囲（西端から東端まで）
  min_longitude = 122.934570
  max_longitude = 153.986672

  latitude = Faker::Number.between(from: min_latitude, to: max_latitude)
  longitude = Faker::Number.between(from: min_longitude, to: max_longitude)

  return [latitude, longitude]
end

10.times do
  latitude, longitude = random_coordinates_in_japan
  shop = Shop.new(latitude: latitude,
                  longitude: longitude,
                  address: Faker::Address.full_address,
                  name: Faker::Lorem.sentence,
                  genre: Faker::Food.ethnic_category)
  shop.save!
end


20.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
  user.save!
  user.reviews.create!( rate: rand(1..5),
                      comment: Faker::Lorem.paragraph(sentence_count: 4),
                      counter_sheets_available: random_true_false,
                      frequent_solo_visitors: give_review,
                      solo_tables_available: random_true_false,
                      easy_to_order: give_review,
                      delivery_speed: give_review,
                      calmness: give_review,
                      shop_id: rand(1..Shop.count))
end

Shop.all.each do |shop|
  10.times do
    review = shop.reviews.build(rate: rand(1..5), comment: Faker::Lorem.paragraph(sentence_count: 4),
                        counter_sheets_available: random_true_false,
                        frequent_solo_visitors: give_review,
                        solo_tables_available: random_true_false,
                        easy_to_order: give_review,
                        delivery_speed: give_review,
                        calmness: give_review)
    review.save!
  end
end