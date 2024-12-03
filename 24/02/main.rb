file = File.open('input.txt')

reports = file.readlines.map { |line| line.split.map(&:to_i) }
num_safe_reports = 0
reports.each do |report|
  num_safe_reports += 1 if (report == report.sort ||
                            report == report.sort.reverse) &&
                           report.each_cons(2).all? { |a, b| (a - b).abs.between?(1, 3) }
end

puts num_safe_reports
