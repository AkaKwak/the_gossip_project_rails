# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# require 'faker'

# 10.times do
#   user = User.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name
#   )

#   rand(1..5).times do
#     Gossip.create(
#       title: Faker::Book.title,
#       content: Faker::Lorem.paragraph(sentence_count: 5),
#       user: user
#     )
#   end
# end

# puts "La seed à creer 10 utilisateurs avec des potins"

require 'faker'
require 'bcrypt'

# Suppression des anciennes données dans l'ordre de dépendance
Like.destroy_all
Comment.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

# Création de villes
5.times do
  City.create(name: Faker::Address.city)
end

# Création d'utilisateurs avec des mots de passe hachés via bcrypt
10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..80),
    email: Faker::Internet.unique.email,
    description: Faker::Lorem.sentence,
    city: City.all.sample,
    password: BCrypt::Password.create("password") # mot de passe par défaut
  )

  # Création de gossips associés à chaque utilisateur
  rand(1..3).times do
    gossip = Gossip.create(
      title: Faker::Book.title.truncate(28),
      content: Faker::Lorem.paragraph(sentence_count: 5),
      user: user
    )

    # Création de commentaires pour chaque gossip
    rand(1..2).times do
      Comment.create(
        content: Faker::Lorem.sentence,
        user: User.all.sample, # un commentaire peut être fait par un utilisateur aléatoire
        gossip: gossip
      )
    end

    # Ajout de likes pour chaque gossip
    rand(1..5).times do
      Like.create(
        user: User.all.sample, # un like peut être fait par un utilisateur aléatoire
        gossip: gossip
      )
    end
  end
end

puts "La seed a créé des utilisateurs, des gossips, des commentaires et des likes avec succès !"
