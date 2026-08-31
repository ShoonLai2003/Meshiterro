# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "seedの実行を開始"

olivia = User.find_or_create_by!(email_address: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

james = User.find_or_create_by!(email_address: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

lucas = User.find_or_create_by!(email_address: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

adam = User.find_or_create_by!(email_address: "adam@example.com") do |user|
  user.name = "Adam"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
end

PostImage.find_or_create_by!(shop_name: "Cavello") do |post_image|
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_image.caption = "大人気のカフェです。"
  post_image.user = olivia
end

PostImage.find_or_create_by!(shop_name: "和食屋せん") do |post_image|
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post_image.caption = "日本料理は美しい！"
  post_image.user = james
end

PostImage.find_or_create_by!(shop_name: "ShoreditchBar") do |post_image|
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  post_image.caption = 'メキシコ料理好きな方にオススメ！'
  post_image.user = lucas
end

puts "seedの実行が完了しました"