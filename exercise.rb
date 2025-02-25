# trying on throw-away travel chromebook
# github.dev?
#  - no extensions :(
# zed?
#  - chromeos linux contianer problem..?
# emacs
#  - lol, the only thing that works on this thing!
#  - can use pry to see methods

# first attempt, slowly

class Exercise
  
  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str) # note: use self.method for static methods; the tests use it
    words = str.split(/\b/) # array, split by regex word (b)oundary
    
    words.each_with_index do |word, i| # TODO: vs map
      if word.match?(/\w+/) and word.length > 4 # match regex (w)ord
        if word[0] == word[0].upcase # no char type in ruby
          words[i] = "Marklar"
        else
          words[i] = "marklar"
        end
      #else
          #words[i] = word
      end
    end

    return words.join
  end


  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    # case
    #   when nth < 0 # note: couldn't combine this with the next case statement..
    #   	raise "no negative"
    # end
    
    case nth
      when ->(x) { x < 0 } # hmm
        raise "no negative"
      when 0
      	return 0
      when 1, 2
      	return 1
    end
    
    c, n, t = 1, 1, 0 # current, next, temp swap; default values: f(1)=1, f(2)=1
      # note syntax error: a, b = 1
      # note: next is a keyword?
    sum = 0
    
    # doesn't ask for the sequence.. just the sum
    # so no need to store the sequence in an array
    (nth - 2).times do
      t = c # ruby probably has fancy swap syntax..
      c = n # iterate
      n += t # next = sum of last two

      if n.even?
        sum += n
      end
    end
    
    return sum
  end

  def self.test_marklar
    puts Exercise.marklar("  1 four more-than-four Capital-falcon")
  end
  
  def self.test_fib
    begin
      puts even_fibonacci(-1)
    rescue => e
      puts e
    end
    # wow, what a pain.. use puts instead of exception

    for i in 0..35 do
      puts Exercise.even_fibonacci(i)
    end
  end

end


#Exercise.test_marklar
#Exercise.test_fib
#binding.pry
