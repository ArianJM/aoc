file = File.open('input.txt')

def check_conditions(levels)
  (levels == levels.sort || levels == levels.sort.reverse) && levels.each_cons(2).all? { (_1 - _2).abs.between?(1, 3) }
end

reports = file.readlines.map { _1.split.map(&:to_i) }
num_safe_reports = 0
reports.each do
  num_safe_reports += 1 if check_conditions(_1)
end

puts "Part 1 answer: #{num_safe_reports}"

num_safe_reports = 0
reports.each do |report|
  (0...report.length).any? do |index|
    levels_list = report[0...index] + report[index+1..-1]
    num_safe_reports += 1 if check_conditions(levels_list)
  end
end

puts "Part 2 answer: #{num_safe_reports}"
