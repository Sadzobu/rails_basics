# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!([{ title: 'Backend' },
                               { title: 'Frontend' },
                               { title: 'Machine Learning' }])

users = User.create!([{ name: 'Admin_1', email: 'admin_1@ya.ru' },
                      { name: 'Admin_2', email: 'admin_2@ya.ru' },
                      { name: 'User_1', email: 'user_1@ya.ru' },
                      { name: 'User_2', email: 'user_2@ya.ru' }])

tests = Test.create!([{ title: 'Ruby 0 0', level: 0, category: categories[0], author: users[0] },
                      { title: 'Ruby 1 1', level: 1, category: categories[1], author: users[0] },
                      { title: 'Python 0 0', level: 0, category: categories[0], author: users[0] },
                      { title: 'Python 1 2', level: 1, category: categories[2], author: users[1] },
                      { title: 'HTML 1 0', level: 1, category: categories[0], author: users[1] }])

questions = Question.create!([{ body: 'Ruby 0 0 question', test: tests[0] },
                              { body: 'Ruby 0 0 question', test: tests[0] },
                              { body: 'Ruby 1 1 question', test: tests[1] },
                              { body: 'Ruby 1 1 question', test: tests[1] },
                              { body: 'Python 0 0 question', test: tests[2] },
                              { body: 'Python 1 2 question', test: tests[3] },
                              { body: 'HTML 1 0 question', test: tests[4] }])

Answer.create!([{ body: 'Ruby 0 0 correct answer', correct: true, question: questions[0] },
                { body: 'Ruby 0 0 correct answer', correct: true, question: questions[1] },
                { body: 'Ruby 1 1 correct answer', correct: true, question: questions[2] },
                { body: 'Ruby 1 1 correct answer', correct: true, question: questions[3] },
                { body: 'Python 0 0 correct answer', correct: true, question: questions[4] },
                { body: 'Python 1 2 correct answer', correct: true, question: questions[5] },
                { body: 'HTML 1 0 correct answer', correct: true, question: questions[6] },
                { body: 'Ruby 0 0 incorrect answer', correct: false, question: questions[0] },
                { body: 'Ruby 0 0 incorrect answer', correct: false, question: questions[1] },
                { body: 'Ruby 1 1 incorrect answer', correct: false, question: questions[2] },
                { body: 'Ruby 1 1 incorrect answer', correct: false, question: questions[3] },
                { body: 'Python 0 0 incorrect answer', correct: false, question: questions[4] },
                { body: 'Python 1 2 incorrect answer', correct: false, question: questions[0] },
                { body: 'HTML 1 0 incorrect answer', correct: false, question: questions[0] }])


TestCompletion.create!([{ user: users[2], test: tests[1] },
                        { user: users[2], test: tests[2] },
                        { user: users[2], test: tests[3] },
                        { user: users[3], test: tests[4] },
                        { user: users[3], test: tests[0] },
                        { user: users[3], test: tests[1] },
                        { user: users[3], test: tests[2] }])
