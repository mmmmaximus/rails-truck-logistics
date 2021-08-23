# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Truck.destroy_all
Driver.destroy_all
Route.destroy_all
Cargo.destroy_all
ModelType.destroy_all

FactoryBot.create_list(:truck, 3)
FactoryBot.create_list(:driver, 3)
FactoryBot.create_list(:route, 3)
FactoryBot.create_list(:cargo, 3)
FactoryBot.create_list(:model_type, 3)
