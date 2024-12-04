file = File.open('input.txt')

columns = file.readlines.map { |line| line.split.map(&:to_i) }.transpose
sorted_columns = columns.map(&:sort)

difference_sum = sorted_columns[0].zip(sorted_columns[1]).sum { |a, b| (a - b).abs }

puts "First part answer: #{difference_sum}"

count_second = sorted_columns[1].tally

similarity_score = sorted_columns[0].sum { |num| num * (count_second[num] || 0) }

puts "Second part answer: #{similarity_score}"
