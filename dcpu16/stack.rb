module Dcpu16Asm

  #
  # = Stack
  #
  # Maps the values associated with the stack to their respective binary value.
  #
  module Stack

    #
    # Returns the binary value associated with the stack directive.
    #
    # == Returns
    #
    # A string of characters
    #
    def to_s
      case text_value
      when 'POP'
        '011000'
      when 'PEEK'
        '011001'
      when 'PUSH'
        '011010'
      end
    end

    def next_word?
      false
    end
  end
end
