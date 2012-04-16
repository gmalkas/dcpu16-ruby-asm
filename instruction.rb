module Dcpu16Asm

  class Instruction < Treetop::Runtime::SyntaxNode
    def to_bin
      ["0000"].pack("b*")
    end
  end

end
