def substrings(string, arr_of_substrings)
    words = string.downcase.split(/\W+/)
    arr_of_substrings.reduce(Hash.new(0)) do |result, substring|
        for word in words do
            result[substring] += 1 if word.include?(substring.downcase)
        end
        result
    end
end