def shift_letter(letter, a, z, number)
    if(letter + number <= z)
        return (letter + number).chr
    else
        return ((a - 1) + (letter + number - z)).chr
    end
end

def caesar_cipher(string, number)
    arr = string.split('').map do |letter|
        if (letter.match(/[A-Z]/))
            letter = shift_letter(letter.ord, 'A'.ord, 'Z'.ord, number)
        elsif (letter.match(/[a-z]/))
            letter = shift_letter(letter.ord, 'a'.ord, 'z'.ord, number)
        else
            letter
        end
    end
    arr.join('')
end