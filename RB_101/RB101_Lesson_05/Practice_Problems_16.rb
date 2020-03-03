#array = [*('a'..'f'),*('0'..'9')].shuffle[0,36]
require "pry"
require "pry-byebug"


def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  binding.pry
  ('a'..'f').each { |digit| characters << digit }
  p characters
  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
    p uuid
  end

  p uuid
end

p generate_UUID