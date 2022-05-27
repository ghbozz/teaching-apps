User.destroy_all
Game.destroy_all
UserGame.destroy_all
Question.destroy_all
GameQuestion.destroy_all
Answer.destroy_all
Theme.destroy_all

User.create!(email: 'romain@lewagon.org', password: 'mdpmdp', username: 'romain')
User.create!(email: 'laura@lewagon.org', password: 'mdpmdp', username: 'laura')

%w[Art Geography Science].each do |theme|
  Theme.create!(name: theme)
end

q_1 = Question.create!(content: 'What is the capital of France?', theme: Theme.find_by(name: 'Geography'))
Answer.create!(content: 'Paris', question: q_1, correct: true)
Answer.create!(content: 'Lyon', question: q_1, correct: false)
Answer.create!(content: 'Marseille', question: q_1, correct: false)
Answer.create!(content: 'Lille', question: q_1, correct: false)

q_2 = Question.create!(content: 'What is the capital of Spain?', theme: Theme.find_by(name: 'Geography'))
Answer.create!(content: 'Madrid', question: q_2, correct: true)
Answer.create!(content: 'Barcelona', question: q_2, correct: false)
Answer.create!(content: 'Valencia', question: q_2, correct: false)
Answer.create!(content: 'Seville', question: q_2, correct: false)

q_3 = Question.create!(content: 'What is the capital of England?', theme: Theme.find_by(name: 'Geography'))
Answer.create!(content: 'London', question: q_3, correct: true)
Answer.create!(content: 'Liverpool', question: q_3, correct: false)
Answer.create!(content: 'Manchester', question: q_3, correct: false)
Answer.create!(content: 'Birmingham', question: q_3, correct: false)






