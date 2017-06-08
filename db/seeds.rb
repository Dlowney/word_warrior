# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#{ }"We found a cat that had been [abandoned] by its owners when they moved away.&&&{0}The house has looked [abandoned] since the Bates family moved away 2 years ago."


# database = 'abandon&&&{0}We found a cat that had been [abandoned] by its owners when they moved away.&&&{0}The house has looked [abandoned] since the Bates family moved away 2 years ago.&&&{0}The police finally had to [abandon] their search after looking for the lost child for over a year.&&&{0}They [abandoned] the dog because they could no longer take care of it.&&&{0}A mother panda often gives birth to two cubs, but [abandons] one, and only takes care of the other.&&&{0}Three million cars are [abandoned] every year in the United States.&&&{0}If frightened or threatened, a mother rabbit may [abandon], ignore, or eat her babies.&&&{0}We had to [abandon] our plans to buy our own house after I got laid off at work.&&&{0}By the early 5th century, Rome had [abandoned] its lands on the British Isles.&&&{0}Bob Marley sang, "Until the philosophy which holds one race superior, and another inferior is finally, and permanently discredited and [abandoned], there will be war."&&&{0}The young woman was arrested for [abandoning] her baby after the infant was found alone at a bus station.&&&{0}Discussion question: A teenager abandons her newborn baby on the doorstep of the home of a wealthy family. What should be done with the teenage mother and the baby?
# abduct&&&{0}A father who was angry after losing custody of his children following his divorce has [abducted] the two children, and fled the country.&&&{0}A rich businessman was [abducted] at gunpoint by four masked men who are asking for one million pounds for his safe return.&&&{0}The [abduction] of British diplomat James Cross by Quebec separatists was one of the most important events in modern Canadian history.&&&{0}Hospital officials have increased security around the nursery following reports of a woman who was trying to [abduct] a baby.&&&{0}According to a newspaper article I read, most child [abductions] that occur are committed by a divorced parent.&&&{0}In an army-led revolt in Haiti in 1991, President Jean-Bertrand Aristide was [abducted] and deported to Venezuela.&&&{0}In March of 1996, three American soldiers were jailed in Japan for up to seven years for the [abduction] and rape of a schoolgirl in Okinawa.&&&{0}In 2002, in the southern Chinese province of Guangxi, a man was executed for [abducting] and then selling 104 women as brides to poor farmers.&&&{0}In some developing countries, children are [abducted] from their homes and recruited into the army.&&&{0}Discussion question: Has there ever been a famous case of abduction in your country? Talk about it.&&&{0}Find someone who knows of a famous person who has been abducted.'

# blocks = database.split("\n")

# block = 'abandon&&&{0}We found a cat that had been [abandoned] by its owners when they moved away.&&&{0}The house has looked [abandoned] since the Bates family moved away 2 years ago.&&&{0}The police finally had to [abandon] their search after looking for the lost child for over a year.&&&{0}They [abandoned] the dog because they could no longer take care of it.&&&{0}A mother panda often gives birth to two cubs, but [abandons] one, and only takes care of the other.&&&{0}Three million cars are [abandoned] every year in the United States.&&&{0}If frightened or threatened, a mother rabbit may [abandon], ignore, or eat her babies.&&&{0}We had to [abandon] our plans to buy our own house after I got laid off at work.&&&{0}By the early 5th century, Rome had [abandoned] its lands on the British Isles.&&&{0}Bob Marley sang, "Until the philosophy which holds one race superior, and another inferior is finally, and permanently discredited and [abandoned], there will be war."&&&{0}The young woman was arrested for [abandoning] her baby after the infant was found alone at a bus station.&&&{0}Discussion question: A teenager abandons her newborn baby on the doorstep of the home of a wealthy family. What should be done with the teenage mother and the baby?'




# questions = []

# separate_block = block.split("&&&{0}")

# #separate_block.first

# block.split("&&&{0}").each do |morceau|

#   if morceau = block.first
#     p morceau
#   # elsif morceau.length < 15                            #morceau.!include? " "
#   #   questions[morceau] = Hash.new

#   else
#     if morceau.include? "["
#       pieces = morceau.split("[")
#       first_part = pieces.first
#       second_part = pieces.last
#       last_part = second_part.split("]")

#      sentence = first_part + "[]" + last_part.last
#      missing_word = last_part.first

#      Question.create()

#      questions[sentence] = missing_word
#     else
#     end
#   end
# end


#  questions


# pieces = line.split("[")

# first_part = pieces.first

# second_part = pieces.last
# last_part = second_part.split("]")

# #-----------------
#  p sentence = first_part + "[]" + last_part.last
#  p missing_word = last_part.first

# questions = {
# headword => [line, line, ..],
# headword => [line, line, ..],
# headword => [line, line, ..],
# headword => [line, line, ..],
# ..
# }

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






questions = Question.create([
  {sentence: "His [] to speak French has limited his advancement in the federal public service.", missing_word: "inability"},
  {sentence: "It can be quite difficult to really define [ ] ideas, such as love or friendship.", missing_word: "abstract"},
  {sentence: "The governor has received a great deal of [] publicity as a result of the scandal.", missing_word: "adverse"},
   ])

p questions
