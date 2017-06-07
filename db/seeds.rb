# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#{ }"We found a cat that had been [abandoned] by its owners when they moved away.&&&{0}The house has looked [abandoned] since the Bates family moved away 2 years ago."


database = 'abandon&&&{0}We found a cat that had been [abandoned] by its owners when they moved away.&&&{0}By the early 5th century, Rome had [abandoned] its lands on the British Isles.&&&{0}Bob Marley sang, "Until the philosophy which holds one race superior, and another inferior is finally, and permanently discredited and [abandoned], there will be war."&&&{0}The young woman was arrested for [abandoning] her baby after the infant was found alone at a bus station.&&&{0}Discussion question: A teenager abandons her newborn baby on the doorstep of the home of a wealthy family. What should be done with the teenage mother and the baby?
abduct&&&{0}A father who was angry after losing custody of his children following his divorce has [abducted] the two children, and fled the country.'

database_separee = database.split("&&&{0}")

questions = {}

database_separee.each do |morceau|
  if morceau.include? "."

  end
end



questions = {
headword => [line, line, ..],
headword => [line, line, ..],
headword => [line, line, ..],
headword => [line, line, ..],
..
}

# several_lines = "abandon&&&{0}We found a cat that had been [abandoned] by its owners when they moved away.&&&{0}The house has looked [abandoned] since the Bates family moved away 2 years ago."
# essai = several_lines.split("")
# p essai





#if le caractère avant '\&&&{0}' == '.' || '?' || '!'



#     Take a line and split in two parts: the word and the sentence(where the word is emplaced by brackets)
#line = "We found a cat that had been [abandoned] by its owners when they moved away."

# pieces = line.split("[")

# first_part = pieces.first

# second_part = pieces.last
# last_part = second_part.split("]")

# #-----------------
#  p sentence = first_part + "[]" + last_part.last
#  p missing_word = last_part.first
# #-----------------
# #---------------------------------
# #----------------------------------------------------------






# questions = Question.create([
#   {sentence: "His [] to speak French has limited his advancement in the federal public service.", missing_word: "inability"},
#   {sentence: "It can be quite difficult to really define [ ] ideas, such as love or friendship.", missing_word: "abstract"},
#   {sentence: "The governor has received a great deal of [] publicity as a result of the scandal.", missing_word: "adverse"},
#   {sentence: "Manchester has beaten Liverpool three times this season, with an [] score of 7 - 3.", missing_word: "aggregate"},
#   {sentence: "The teacher [] that a number of students had cheated on the test, but the accusation was later shown to be completely untrue.", missing_word: "alleged"},
#   {sentence: "ESL students often try to draw [] between English and their mother tongue, but it is not always possible.", missing_word: "analogies"},
#   {sentence: "It could take weeks to [] all the data, but when we do, the results will be very helpful to our project.", missing_word: "analyze"},
#   {sentence: "Japanese people bow at different [] to show different meaning.", missing_word: "angles"},
#   {sentence: "It is important for our organization to remain [] from the government so that we can make decisions which are free from political influence.", missing_word: "autonomous"},
#   {sentence: " The [] child watches almost 3 hours of television per day.", missing_word: "average"} ])
