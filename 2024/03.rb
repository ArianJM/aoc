content = File.read('input-03.txt')

def find_muls_and_multiply(string)
  matches = string.scan(/mul\((\d{1,3}),(\d{1,3})\)/)
  matches.sum { (_1.to_i * _2.to_i) }
end

puts "First part answer: #{find_muls_and_multiply(content)}"

content_for_part_2 = content.gsub(/don't\(\).*?do\(\)/m, '')

puts "Second part answer: #{find_muls_and_multiply(content_for_part_2)}"
