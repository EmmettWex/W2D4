# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    num_1_multiples = []
    num_2_multiples = []

    if num_1 > num_2
        (1..num_1).each do |num|
            num_1_multiples << num * num_1
            num_2_multiples << num * num_2
        end
    else
        (1..num_2).each do |num|
            num_1_multiples << num * num_1
            num_2_multiples << num * num_2
        end
    end

    num_1_multiples.each { |mult| return mult if num_2_multiples.include?(mult) }
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = []
    bigramHash = Hash.new(0)

    str.each_char.with_index do |char, idx|
        bigrams << str[idx] + str[idx+1] if str[idx+1] != nil
    end

    bigrams.each { |bigram| bigramHash[bigram] += 1 }

    most_common = bigramHash.sort_by() { |k,v| v }

    most_common[-1][0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        reversedHash = Hash.new(0)
        self.each() { |k,v| reversedHash[v] = k }
        reversedHash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each.with_index do |num1, idx1|
            self[idx1+1..-1].each.with_index do |num2, idx2|
                count += 1 if (num1 + num2) == num
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        sorted = false

        while sorted == false
            sorted = true
            (0...self.length-1).each do |idx|
                if prc.call(self[idx], self[idx+1]) == 1
                    self[idx], self[idx+1] = self[idx+1], self[idx]
                    sorted = false
                end
            end
        end
        self
    end
end
