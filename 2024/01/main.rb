file = File.open('input.txt')

columns = file.readlines.map { _1.split.map(&:to_i) }.transpose
sorted_columns = columns.map(&:sort)

difference_sum = sorted_columns[0].zip(sorted_columns[1]).sum { (_1 - _2).abs }

puts "First part answer: #{difference_sum}"

count_second = sorted_columns[1].tally

similarity_score = sorted_columns[0].sum { _1 * (count_second[_1] || 0) }

puts "Second part answer: #{similarity_score}"
