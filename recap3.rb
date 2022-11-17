def no_dupes?(arr)
    dupe_detector = Hash.new(0)
    no_dupes = []

    arr.each { |ele| dupe_detector[ele] += 1 }

    dupe_detector.each() { |k,v| no_dupes << k if v == 1 }

    no_dupes

end

# # Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each { |idx| return false if arr[idx] == arr[idx+1] }
    true
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    indexHash = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |char, idx| indexHash[char] << idx }
    indexHash
end

# # Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    return str if str.length < 2

    longest_streak = ""
    current_streak = ""

    (0...str.length-1).each do |idx|
        if str[idx] != str[idx+1]
            current_streak = str[idx+1]
        elsif str[idx] == str[idx+1]
            current_streak += str[idx+1]
        end

        longest_streak = current_streak if current_streak.length >= longest_streak.length
    end
    longest_streak
end

# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'