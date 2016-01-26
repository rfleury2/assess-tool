# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(name: "Ricardo Fleury", email: "rfleury2@gmail.com", password: 'password', password_confirmation: 'password')

question = user.questions.create!(prompt: "Who is the President of France?")
question.answers.create!(content: "Francois Hollande", correct: true)
question.answers.create!(content: "Charles de Gaulle", correct: false)
question.answers.create!(content: "Jacques Chirac", correct: false)
question.answers.create!(content: "Pepe le Pew", correct: false)

question = user.questions.create!(prompt: "Who won the 1998 World Cup?")
question.answers.create!(content: "Germany", correct: false)
question.answers.create!(content: "Brazil", correct: false)
question.answers.create!(content: "France", correct: true)
question.answers.create!(content: "Spain", correct: false)

question = user.questions.create!(prompt: "Where were the 1992 Olympics held?")
question.answers.create!(content: "Atlanta", correct: false)
question.answers.create!(content: "Barcelona", correct: true)
question.answers.create!(content: "London", correct: false)
question.answers.create!(content: "Sydney", correct: false)

question = user.questions.create!(prompt: "Who let the dogs out?")
question.answers.create!(content: "Beethoven", correct: false)
question.answers.create!(content: "Baha-men", correct: false)
question.answers.create!(content: "Michael Vick", correct: true)
question.answers.create!(content: "Air Bud", correct: false)