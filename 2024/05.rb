content = File.read('input-05.txt')

page_ordering, updates = content.split("\n\n")

def get_ordering(page_ordering)
  ordering_dictionary = Hash.new { |h, k| h[k] = { before: [], after: [] } }
  page_ordering.split("\n").each do |line|
    num1, num2 = line.split('|').map(&:to_i)
    ordering_dictionary[num1][:before] << num2
    ordering_dictionary[num2][:after] << num1
  end
  ordering_dictionary
end

def is_correct?(nums, ordering_dictionary)
  before_ok = true
  after_ok = true
  nums.each_with_index do |num, index|
    nums[0...index].each do |before_num|
      if !ordering_dictionary[num][:after].include?(before_num)
        before_ok = false
        break
      end
    end

    nums[index + 1..-1].each do |after_num|
      if !ordering_dictionary[num][:before].include?(after_num)
        after_ok = false
        break
      end
    end
  end
  before_ok && after_ok
end

def get_correct_and_incorrect_updates(ordering_dictionary, updates)
  correct_updates= []
  incorrect_updates = []

  updates.split("\n").map do |line|
    nums = line.split(',').map(&:to_i)

    if (is_correct?(nums, ordering_dictionary))
      correct_updates << nums
    else
      incorrect_updates << nums
    end
  end
  [correct_updates, incorrect_updates]
end

def add_middle_values(num_arrays)
  sum = 0
  num_arrays.each do |nums|
    sum += nums[nums.size / 2]
  end
  sum
end

def sort_incorrect_updates(incorrect_updates, ordering_dictionary)
  fixed = []
  incorrect_updates.each do |nums|
    correct_order = []
    while correct_order.size != nums.size
      correct_order << nums[nums.index { |num| 
        applicable_after = ordering_dictionary[num][:after].filter{ |after_num| nums.include?(after_num) }

        applicable_after.size === correct_order.size
      }]
    end
    fixed << correct_order
  end
  fixed
end

ordering_dictionary = get_ordering(page_ordering)
correct_updates, incorrect_updates = get_correct_and_incorrect_updates(ordering_dictionary, updates)

puts "Part one answer: ", add_middle_values(correct_updates)

sorted_incorrect_updates = sort_incorrect_updates(incorrect_updates, ordering_dictionary)

puts "Part two answer: ", add_middle_values(sorted_incorrect_updates)
