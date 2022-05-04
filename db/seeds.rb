# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

# Posts
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hello 2', text: 'This is my second post')
third_post = Post.create(author: first_user, title: 'Hello 3', text: 'This is my third post')
fourth_post = Post.create(author: first_user, title: 'Hello 4', text: 'This is my fourth post')
fifth_comment = Post.create(author: first_user, title: 'Hello 5', text: 'This is my fifth post')

# Comments
first_comment = Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
second_comment = Comment.create(post: first_post, author: second_user, text: 'Hello Tom!' )
third_comment = Comment.create(post: first_post, author: second_user, text: 'Nice Post Tom!' )
fourth_comment = Comment.create(post: first_post, author: second_user, text: 'Hola Tom!' )
fifth_comment = Comment.create(post: first_post, author: second_user, text: 'Ciao Tom!' )
sixth_comment = Comment.create(post: first_post, author: second_user, text: 'Hallo Tom!' )
