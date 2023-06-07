# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: second_user, title: 'ruby ', text: 'ruby is amazing')
third_post = Post.create(author: first_user, title: 'Ruby for beginner', text: 'Ruby also complex for beginner')
fourth_post = Post.create(author: second_user, title: 'ruby on rails', text: 'ruby on rails is ')
fith_post = Post.create(author: first_user, title: 'Hello Microverse', text: 'Microverse is cool school you will gain practical skill ')
sixth_post = Post.create(author: second_user, title: 'Front end', text: 'Front end framewrks are react, bootsrap etc')
seventh_post = Post.create(author: first_user, title: 'back end ', text: 'ruby on rail  programming languages is the new one')
eigth_post = Post.create(author: second_user, title: 'full stack', text: 'full stack developer should know both front and backend programing') 



Comment.create(post: first_post, author: first_user, text: 'Hi Tom!' )
Comment.create(post: second_post, author: second_user, text: 'Hi Lilly!' )
Comment.create(post: third_post, author: first_user, text: 'how are you doing!' )
Comment.create(post: fourth_post, author: second_user, text: 'I am good you did well!' )
Comment.create(post: fith_post, author: first_user, text: 'Wow greate thank you' )
Comment.create(post: sixth_post, author: second_user, text: 'you are welcome' )
Comment.create(post: seventh_post, author: first_user, text: 'Thank you bye' )
Comment.create(post: first_post, author: second_user, text: 'bye' )


Like.create(post: first_post, author: first_user)
Like.create(post: second_post, author: second_user)


