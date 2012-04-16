require 'treetop'
require_relative './instruction'
require_relative './program'
require_relative './dcpu16_grammar'

Treetop.load "dcpu16_grammar"

program = <<ASM
  SET A, 0x30              ; 7c01 0030
  SET [0x1000], 0x20       ; 7de1 1000 0020
  SUB A, [0x1000]          ; 7803 1000
ASM

parser = Dcpu16AsmParser.new
if result = parser.parse(program)
    puts 'success'
    p result.elements.size
else
    puts parser.failure_reason
end
