# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Enologist.destroy_all

# 10.times do
#     enologist = Enologist.create(name: Faker::Name.name,
#                     age: Faker::Number.within(range: 20..99),
#                     nationality: Faker::Nation.nationality)
#     enologist.save
#     puts "Se han creado estos #{enologist.name}, su edad es: #{enologist.age} y su nacionalidad es: #{enologist.nationality}"
# end


8.times do
    magazine = Magazine.create(name: Faker::Space.galaxy)
    magazine.save
    puts "Estas son las revistas: #{magazine.name}"
end