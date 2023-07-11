# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
admin = User.create(email: 'diegoalejandrosilvarodriguez@gmail.com', password: '1985bufalo', role: :admin, first_name: 'Diego', last_name: 'Silva')
author = User.create(email: 'diegosilvarodriguez@hotmail.com', password: '123456', role: :author, first_name: 'Diego', last_name: 'Rodriguez')

