categories = Category.create!([{ title: "Backend" },
                               { title: "Frontend" }])

users = User.create!([{ name: "Kao", last_name: "Kage", email: "admin_1@ya.ru", password: "123456", type: "Admin" }])

tests = Test.create!([{ title: "Ruby", level: 1, category: categories[0], author: users[0] },
                      { title: "HTML", level: 0, category: categories[1], author: users[0] }])

questions = Question.create!([{ body: "Ruby is an object-oriented general-purpose programming language", test: tests[0] },
                              { body: "Which of the following is supported by Ruby?", test: tests[0] },
                              { body: "Ruby is what kind of programming language?", test: tests[0] },
                              { body: "The following is a primitive type in Ruby", test: tests[0] },
                              { body: "What does HTML stand for?", test: tests[1] },
                              { body: "How many tags are in a regular element?", test: tests[1] },
                              { body: "What is the difference between an opening tag and a closing tag?", test: tests[1] },
                              { body: "< br  / > What type of tag is this?", test: tests[1] }])

Answer.create!([{ body: "Correct", correct: true, question: questions[0] },
                { body: "Incorrect", correct: false, question: questions[0] },

                { body: "Multiple Programming Paradigms", correct: false, question: questions[1] },
                { body: "Dynamic Type System", correct: false, question: questions[1] },
                { body: "Automatic Memory Management", correct: false, question: questions[1] },
                { body: "All of the Mentioned", correct: true, question: questions[1] },

                { body: "Strongly typed/Statically typed", correct: false, question: questions[2] },
                { body: "Strongly typed/Dynamically typed", correct: true, question: questions[2] },
                { body: "Weakly typed/Statically typed", correct: false, question: questions[2] },
                { body: "Weakly typed/Dynamically typed", correct: false, question: questions[2] },

                { body: "Integer", correct: false, question: questions[3] },
                { body: "String", correct: false, question: questions[3] },
                { body: "Float", correct: false, question: questions[3] },
                { body: "None of the Above", correct: true, question: questions[3] },

                { body: "Hyper Text Markup Language", correct: true, question: questions[4] },
                { body: "Hot Mail", correct: false, question: questions[4] },
                { body: "How to Make Lasagna", correct: false, question: questions[4] },

                { body: "2", correct: true, question: questions[5] },
                { body: "1", correct: false, question: questions[5] },
                { body: "3", correct: false, question: questions[5] },

                { body: "Opening tag has a / in front", correct: false, question: questions[6] },
                { body: "Closing tag has a / in front", correct: true, question: questions[6] },
                { body: "There is no difference", correct: false, question: questions[6] },

                { body: "Break tag", correct: true, question: questions[7] },
                { body: "Empty tag", correct: false, question: questions[7] },
                { body: "An opening tag", correct: false, question: questions[7] }])
