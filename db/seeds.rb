# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

questions = Question.create([
  {sentence: "His [] to speak French has limited his advancement in the federal public service.", missing_word: inability"},
  {sentence: "It can be quite difficult to really define [] ideas, such as love or friendship.", missing_word: "abstract"},
  {sentence: "The governor has received a great deal of [] publicity as a result of the scandal.", missing_word: "adverse"},
  {sentence: "Manchester has beaten Liverpool three times this season, with an [] score of 7 - 3.", missing_word: "aggregate"},
  {sentence: "The teacher [] that a number of students had cheated on the test, but the accusation was later shown to be completely untrue.", missing_word: "alleged"},
  {sentence: "ESL students often try to draw [] between English and their mother tongue, but it is not always possible.", missing_word: "analogies"},
  {sentence: "It could take weeks to [] all the data, but when we do, the results will be very helpful to our project.", missing_word: "analyze"},
  {sentence: "Japanese people bow at different [] to show different meaning.", missing_word: "angles"},
  {sentence: "It is important for our organization to remain [] from the government so that we can make decisions which are free from political influence.", missing_word: "autonomous"},
  {sentence: " The [] child watches almost 3 hours of television per day.", missing_word: "average"} ])
