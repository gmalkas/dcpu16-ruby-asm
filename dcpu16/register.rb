module Dcpu16Asm
  
  # 
  # = Register
  #
  # Maps the register names with their respective binary value.
  #
  module Register

    #
    # Returns the binary value associated with the register.
    #
    # == Returns
    #
    # A string of characters
    #
    def to_s
      case text_value
      when 'A'
        '000000'
      when 'B'
        '000001'
      when 'C'
        '000010'
      when 'X'
        '000011'
      when 'Y'
        '000100'
      when 'Z'
        '000101'
      when 'I'
        '000110'
      when 'J'
        '000111'
      when 'SP'
        '011011'
      when 'PC'
        '011100'
      end
    end

    def next_word?
      false
    end
  end
end
