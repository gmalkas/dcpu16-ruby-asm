module Dcpu16Asm
  
  #
  # = Label
  #
  # A label maps a name with an instruction's address.
  #
  module Label

    #
    # The label's address is always encoded on a full word, so the value
    # associated with the instruction is always 0x1F (which stands for 'next word').
    #
    # == Returns
    #
    # A string of characters
    #
    def to_s
      '011111' # 0x1F
    end

    #
    # A label is a value that always refers to a word following the instruction.
    #
    def next_word?
      true
    end

    #
    # Fetches the address associated with the label then converts it
    # to a string of 16 bits.
    #
    # == Returns
    #
    # A string of characters
    #
    def next_word
      Literal.to_bits(Program.label_address(text_value).to_s(2), 16)
    end
  end
end
