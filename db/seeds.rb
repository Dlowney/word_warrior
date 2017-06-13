Question.destroy_all
Level.destroy_all
HeadWord.destroy_all
User.destroy_all
Answer.destroy_all
Attempt.destroy_all

levels = Level.create([
  {name: "EASY", difficulty: 1},
  {name: "EASY", difficulty: 2},
  {name: "EASY", difficulty: 3},
  {name: "MEDIUM", difficulty: 4},
  {name: "MEDIUM", difficulty: 5},
  {name: "MEDIUM", difficulty: 6},
  {name: "HARD", difficulty: 7},
  {name: "HARD", difficulty: 8},
  {name: "HARD", difficulty: 9},
  {name: "EXTRA", difficulty: 10},
])


LEVEL1 = %w(abandoned analyze approach area assess assume authority available benefit concept consist constitute context contract create data define derive distribute economy environment establish estimate evident export factor finance formula function identify income indicate individual interpret involve issue labour legal legislate major method occur percent period policy principle proceed process require research respond role section sector significant similar source specific structure theory vary)
LEVEL2 = %w(achieve acquire administer affect appropriate aspect assist category chapter commission community complex compute conclude conduct consequent construct consume credit culture design distinct element equate evaluate feature final focus impact injure institute invest item journal maintain normal obtain participate perceive positive potential previous primary purchase range region regulate relevant reside resource restrict secure seek select site strategy survey text tradition transfer)
LEVEL3 = %w(alternative circumstance comment compensate component consent considerable constant constrain contribute convene coordinate core corporate correspond criteria deduce demonstrate document dominate emphasis ensure exclude framework fund illustrate immigrate imply initial instance interact justify layer link locate maximise minor negate outcome partner philosophy physical proportion publish react register rely remove scheme sequence sex shift specify sufficient task technical technique technology valid volume)
LEVEL4 = %w(access adequate annual apparent approximate attitude attribute civil code commit communicate concentrate confer contrast cycle debate despite dimension domestic emerge error ethnic goal grant hence hypothesis implement implicate impose integrate internal investigate job label mechanism obvious occupy option output overall parallel parameter phase predict principal prior professional project promote regime resolve retain series statistic status stress subsequent sum summary undertake)
LEVEL5 = %w(academy adjust alter amend aware capacity challenge clause compound conflict consult contact decline discrete draft enable energy enforce entity equivalent evolve expand expose external facilitate fundamental generate generation image liberal licence logic margin medical mental modify monitor network notion objective orient perspective precise prime psychology pursue ratio reject revenue stable style substitute sustain symbol target transit trend version welfare whereas)
LEVEL6 = %w(abstract accurate acknowledge aggregate allocate assign attach author bond brief capable cite cooperate discriminate display diverse domain edit enhance estate exceed expert explicit federal fee flexible furthermore gender ignorant incentive incidence incorporate index inhibit initiate input instruct intelligent interval lecture migrate minimum ministry motive neutral nevertheless overseas precede presume rational recover reveal scope subsidy tape trace transform transport underlie utilize)
LEVEL7 = %w(adapt adult advocate aid channel chemical classic comprehensive comprise confirm contrary convert couple decade definite deny differentiate dispose dynamic eliminate empirical equip extract file finite foundation globe grade guarantee hierarchy identical ideology infer innovate insert intervene isolate media mode paradigm phenomenon priority prohibit publication quote release reverse simulate sole somewhat submit successor survive thesis topic transmit ultimate unique visible voluntary)
LEVEL8 = %w(abandon accompany accumulate ambiguous append appreciate arbitrary automate bias chart clarify commodity complement conform contemporary contradict crucial currency denote detect deviate displace drama eventual exhibit exploit fluctuate guideline highlight implicit induce inevitable infrastructure inspect intense manipulate minimise nuclear offset paragraph plus practitioner predominant prospect radical random reinforce restore revise schedule tense terminate theme thereby uniform vehicle via virtual visual widespread)
LEVEL9 = %w(accommodate analogy anticipate assure attain behalf bulk cease coherent coincide commence compatible concurrent confine controversy converse device devote diminish distort duration erode ethic format found inherent insight integral intermediate manual mature mediate medium military minimal mutual norm overlap passive portion preliminary protocol qualitative refine relax restrain revolution rigid route scenario sphere subordinate supplement suspend team temporary trigger unify violate vision)


database = File.read("#{Rails.root}/db/data/questions.txt")

blocks = database.split("\n")

blocks.each do |block|

  separate_block = block.split("&&&{0}")
  word = separate_block[0]
  missing_words = separate_block.map { |q| q.match(/\[(.*)\]/) }
                                .map { |md| md.to_a.second }
                                .compact.uniq

  level_difficulty = if LEVEL1.include?(word) || LEVEL1.any? { |w| missing_words.include?(w) }
                       1
                     elsif LEVEL2.include?(word) || LEVEL2.any? { |w| missing_words.include?(w) }
                       2
                     elsif LEVEL3.include?(word) || LEVEL3.any? { |w| missing_words.include?(w) }
                       3
                     elsif LEVEL4.include?(word) || LEVEL4.any? { |w| missing_words.include?(w) }
                       4
                     elsif LEVEL5.include?(word) || LEVEL5.any? { |w| missing_words.include?(w) }
                       5
                     elsif LEVEL6.include?(word) || LEVEL6.any? { |w| missing_words.include?(w) }
                       6
                     elsif LEVEL7.include?(word) || LEVEL7.any? { |w| missing_words.include?(w) }
                       7
                     elsif LEVEL8.include?(word) || LEVEL8.any? { |w| missing_words.include?(w) }
                       8
                     elsif LEVEL9.include?(word) || LEVEL9.any? { |w| missing_words.include?(w) }
                       9
                     else
                       10
                     end

  level = Level.find_by(difficulty: level_difficulty)

  head_word = HeadWord.create(
    name: word,
    level_id: level.id
  )

  separate_block.each do |section|
    if section.include? "["  # (pour virer les "Discussion question")
      pieces = section.split("[")
      first_part = pieces.first
      second_part = pieces.last
      last_part = second_part.split("]")

      qsentence = first_part + "[]" + last_part.last
      missingword = last_part.first

      question = Question.create do |question|
          question.sentence = qsentence
          question.missing_word = missingword
          question.head_word = head_word
      end
    end
  end
end

user = User.create(
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
level = Level.find_by(difficulty: 1)

50.times do |i|
  attempt = Attempt.create(user: user)

  10.times do |ii|
    question = level.questions.order("RANDOM()").first
    user_input = [question.missing_word, ""].sample
    Answer.create(
      attempt: attempt,
      question: question,
      user_input: user_input
    )
  end
end














