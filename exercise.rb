# trying on throw-away travel chromebook
# github.dev?
#  - no extensions :(
# zed?
#  - chromeos linux contianer problem..?
# ruby playground?
#  - lol, good enough
#  - can use pry to see methods

# first attempt, slowly

class Exercise
  
  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    words = str.split(" ") # array
    
    words.each_with_index do |word, i| # TODO: vs map
      if word.length > 4
        if word[0] == word[0].upcase # no char type in ruby
          words[i] = "Marklar"
        else
          words[i] = "marklar"
        end
      #else
          #words[i] = word
      end
    end

    return words # for clarity
  end


  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def even_fibonacci(nth)
    case
      when nth < 0 # note: couldn't combine this with the next case statement..
      	raise "no negative"
    end
    
    case nth
      when 0
      	return 0
      when 1, 2
      	return 1
    end
    
    c, n = 1, 1 # current, next; default values: f(1)=1, f(2)=1
      # note syntax error: a, b = 1
      # note: next is a keyword?
    sum = 0
    
    # doesn't ask for the sequence.. just the sum
    # so no need to store the sequence in an array
    (nth - 2).times do
      c = n # iterate
      n = c + n # next = sum of last two
      
      if n.even?
      	sum += n
      end
    end
    
    return sum
  end

  def test_marklar
    marklar("", "1", "four", "more-than-four", "Capital-falcon")
  end
  
  def test_fib
    puts even_fibonacci(-1)
    
    for i in 0..10 do
      puts even_fibonacci(i)
    end
  end

end
