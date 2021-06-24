# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
Comment.destroy_all

users = User.create([
    {
        name: "Dante",
        password: "password"
    },
    {
        name: "Jasper",
        password: "jasper20"
    }
])

posts = Post.create([
    {
        title: "first post!",
        content: "this is my first post!",
        user: User.all.sample
    },
    {
        title: "second post!",
        content: "this is my second post!",
        user: User.all.sample
    }
])
puts "Done!"