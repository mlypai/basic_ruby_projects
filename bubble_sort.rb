def bubble_sort(arr)
    result = arr
    sorted = true;
    loop do
        num = result[0]
        temp_ind = 1
        while (temp_ind < result.length)
            if num > result[temp_ind]
                result[result.index(num)] = result[temp_ind]
                result[temp_ind] = num
                sorted = false
            else
                num = result[temp_ind]
            end
            temp_ind += 1
        end       
        break if sorted
        sorted = true
    end
    result
end