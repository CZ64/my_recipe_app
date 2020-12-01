# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# rails db:seed

# User
User.create(  name: 'fuchida',
              email: 'sample@gmail.com',
              # TODO: password設定する
              encrypted_password: '')

# Unit
['g', 'ml'].each { |unit|
  Unit.create(name: unit)
}

# Category
['鍋料理'].each { |category|
  Category.create(name: category)
}