file = File.open('input.txt')

columns = file.readlines.map { |line| line.split.map(&:to_i) }
sorted_columns = columns.transpose.map(&:sort)

sorted_columns.each_with_index do |column, index|
  puts "Column #{index + 1} (first 5): #{column.first(5)}"
end

difference_sum = sorted_columns[0].zip(sorted_columns[1]).sum { |a, b| (a - b).abs }

puts difference_sum
