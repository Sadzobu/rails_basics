# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'Machine Learning' }])

users = User.create!([{ name: 'Admin_1' }, { name: 'Admin_2' }, { name: 'User_1' }, { name: 'User_2' }])

tests = Test.create!([{ title: 'Ruby 0 0', level: 0, categories_id: categories[0].id, users_id: users[0].id },
                       { title: 'Ruby 1 1', level: 1, categories_id: categories[1].id, users_id: users[1].id },
                       { title: 'Python 0 0', level: 0, categories_id: categories[0].id, users_id: users[0].id },
                       { title: 'Python 1 2', level: 1, categories_id: categories[2].id, users_id: users[1].id },
                       { title: 'HTML 1 0', level: 1, categories_id: categories[1].id, users_id: users[0].id }])

questions = Question.create!([{ body: 'Ruby 0 0 question', tests_id: tests[0].id },
                               { body: 'Ruby 0 0 question', tests_id: tests[0].id },
                               { body: 'Ruby 1 1 question', tests_id: tests[1].id },
                               { body: 'Ruby 1 1 question', tests_id: tests[1].id },
                               { body: 'Python 0 0 question', tests_id: tests[2].id },
                               { body: 'Python 1 2 question', tests_id: tests[3].id },
                               { body: 'HTML 1 0 question', tests_id: tests[4].id }])

answers = Answer.create!([{ body: 'Ruby 0 0 correct answer', correct: true, questions_id: questions[0].id },
                           { body: 'Ruby 0 0 correct answer', correct: true, questions_id: questions[0].id },
                           { body: 'Ruby 1 1 correct answer', correct: true, questions_id: questions[1].id },
                           { body: 'Ruby 1 1 correct answer', correct: true, questions_id: questions[1].id },
                           { body: 'Python 0 0 correct answer', correct: true, questions_id: questions[2].id },
                           { body: 'Python 1 2 correct answer', correct: true, questions_id: questions[3].id },
                           { body: 'HTML 1 0 correct answer', correct: true, questions_id: questions[4].id },
                           { body: 'Ruby 0 0 incorrect answer', correct: false, questions_id: questions[0].id },
                           { body: 'Ruby 0 0 incorrect answer', correct: false, questions_id: questions[0].id },
                           { body: 'Ruby 1 1 incorrect answer', correct: false, questions_id: questions[1].id },
                           { body: 'Ruby 1 1 incorrect answer', correct: false, questions_id: questions[1].id },
                           { body: 'Python 0 0 incorrect answer', correct: false, questions_id: questions[2].id },
                           { body: 'Python 1 2 incorrect answer', correct: false, questions_id: questions[3].id },
                           { body: 'HTML 1 0 incorrect answer', correct: false, questions_id: questions[4].id }])
