module Dcpu16Asm
  module Label
    def address
      Program.label_address(text_value)
    end
  end
end
