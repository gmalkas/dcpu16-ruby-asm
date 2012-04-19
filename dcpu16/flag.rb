module Dcpu16Asm

  #
  # = Flag
  #
  # Maps the flag's name with its binary code.
  #
  # There is only one flag in the current specification : the overflow.
  #
  module Flag

    #
    # Return the flag's code as a string of bits. 
    #
    # == Returns
    #
    # A string of characters
    #
    def to_s
      case text_value
      when 'O' # Overflow
        '011101'
      end
    end

    #
    # Flags don't need another word, since there is only one flag.
    #
    def next_word?
      false
    end
  end
end

