require "pry"
class PigLatinizer

  def find_vowel_index(word)
    word.index(/a|e|i|o|u|A|E|I|O|U/)
  end

  def remove_front(word, index)
    word[index..-1]
  end

  def removed_letters(word, index)
    word[0..(index-1)]
  end

  def piglatinize(word)
    translated_word = word
    word_index = self.find_vowel_index(word)
    (word_index == 0) ? (add_last = "way") : (add_last = "ay")
    translated_word = self.remove_front(word, word_index) if word_index != 0
    translated_word += self.removed_letters(word, word_index) if word_index != 0
    translated_word += add_last
    translated_word
  end

  def to_pig_latin(phrase)
    phrase_array = phrase.split(" ")
    word_array = []
    phrase_array.each do |word|
      translated_word = self.piglatinize(word)
      word_array << translated_word
    end
    word_array.join(" ")
  end
end
