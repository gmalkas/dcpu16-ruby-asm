module Dcpu16Asm
  module MemoryValue
    def to_s
      p register_from_address if address?

      if register? && address?
        Literal.to_bits((register.to_s.to_i(2) + 8).to_s(2), 6)
      elsif address?
        "011110"
      elsif register?
        register.to_s
      end
    end

    def next_word?
      not address.nil?
    end

    def next_word
      address.next_word
    end

    protected

    def register
      elements.select { |e| e.respond_to?(:register) }.first.register if register?
    end

    def register_from_address
      elements.select { |e| e.respond_to?(:address) }.first.elements.select { |e| e.respond_to?(:register) }.first if register?
    end

    def register?
      not elements.select { |e| e.respond_to?(:register) }.empty?
    end

    def address
      elements.select { |e| e.respond_to?(:address) }.first.address if address?
    end

    def address_from_register
      elements.select { |e| e.respond_to?(:register) }.first.elements.select { |e| e.respond_to?(:address) } if address?
    end

    def address?
      not elements.select { |e| e.respond_to?(:address) }.empty?
    end
  end
end
