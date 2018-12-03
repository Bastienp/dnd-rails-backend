# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lists = List.create([{title: 'A rencontrer', step: 'to_meet'}, {title: 'Entretien', step: 'interview'}, {title: 'Embauché', step: 'hired'}])
users = User.create([{firstname: 'Alan', lastname: 'Turing', job: 'Enigma killer', list: List.first, position: 1},
                     {firstname: 'Steve', lastname: 'Jobs', job: 'Producteur de pommes', list: List.first, position: 2},
                     {firstname: 'Leeroy', lastname: 'Jenkins', job: 'Eleveur de dragonnets', list: List.first, position: 3},
                     {firstname: 'Bastien', lastname: 'Poidevain', job: 'Software Engineer', list: List.first, position: 4},
                     {firstname: 'Gandalf', lastname: 'LeBlanc', job: 'Magicien', list: List.first, position: 5}])