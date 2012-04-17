require 'treetop'

require_relative './register'
require_relative './literal'
require_relative './stack'
require_relative './memory_value'
require_relative './flag'

require_relative './basic_instruction_type'
require_relative './basic_instruction'
require_relative './non_basic_instruction'

require_relative './label'
require_relative './label_declaration'

require_relative './instruction'
require_relative './program'

require_relative './dcpu16_grammar'

raise "Need a source!" if ARGV.first.nil?
dest = ARGV.first

Treetop.load "dcpu16_grammar"

source = <<ASM
  SET PC, 0x30              ; 7c01 0030
  SET [0x1000], 0x20       ; 7de1 1000 0020
  SUB A, [0x1000]          ; 7803 1000
  IFN A, 0x10              ; c00d 
  SET A, 0x2000            ; 7c01 2000
  :loop         SET [0x2000+I], [A]      ; 2161 2000
ASM

parser = Dcpu16AsmParser.new
if program = parser.parse(source)
  program.compile(dest)
else
    puts parser.failure_reason
end
