module Dcpu16Asm

  #
  # = MemoryValue
  #
  # Maps memory-related values to their binary representation.
  #
  # A memory value has the following patterns :
  #
  #  [register]
  #  [register + next word]
  #  [next word]
  #
  #  In the following comments, "next word" and "address" are really the same thing.
  #
  module MemoryValue

    #
    # Returns a representation of the value as a string of bits.
    #
    # == Returns
    #
    # A string of character
    #
    def to_s
      # There are 4 cases to consider:
      #   - [register]
      #   - [next word]
      #   - [register + next word]
      #   - [next word + register]
      #
      #   Although the last two cases produce the same binary string, they lead to different syntax trees,
      #   therefore we need to process these cases differently.
      #
      case
      when register_from_address?
        Literal.to_bits((register_from_address.to_s.to_i(2) + 0x10).to_s(2), 6)
      when address_from_register?
        Literal.to_bits((register.to_s.to_i(2) + 0x10).to_s(2), 6)
      when address?
        "011110"
      when register?
        Literal.to_bits((register.to_s.to_i(2) + 0x08).to_s(2), 6) 
      end
    end

    #
    # If there is an address, its value is always specified on the word following the instruction.
    #
    def next_word?
      address? || address_from_register?
    end

    def next_word
      # This conditional is necessary since the syntax tree changes according to the
      # pattern of the value (e.g [next word] or [register + next word])
      (address_from_register?) ? address_from_register.next_word : address.next_word
    end

    protected

    # [register]
    def register
      elements.select { |e| e.respond_to?(:register) }.first.register if register?
    end
    
    # [register]
    def register?
      not elements.select { |e| e.respond_to?(:register) }.empty?
    end
    
    # [address]
    def address
      elements.select { |e| e.respond_to?(:address) }.first.address if address?
    end

    # [address]
    def address?
      not elements.select { |e| e.respond_to?(:address) }.empty?
    end

    # [address + register]
    def register_from_address
      elements.select { |e| e.respond_to?(:address) }.first.elements.select { |e| e.respond_to?(:register) }.first.register
    end

    # [address + register]
    def register_from_address?
      not elements.select { |e| e.respond_to?(:address) }.first.elements.select { |e| e.respond_to?(:register) }.empty? if address?
    end

    # [register + address]
    def address_from_register
      elements.select { |e| e.respond_to?(:register) }.first.elements.select { |e| e.respond_to?(:address) }.first.address
    end

    # [register + address]
    def address_from_register?
      not elements.select { |e| e.respond_to?(:register) }.first.elements.select { |e| e.respond_to?(:address) }.empty? if register?
    end

  end
end
