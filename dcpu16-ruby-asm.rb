require 'treetop'

require_relative './register'
require_relative './literal'
require_relative './stack'
require_relative './memory_value'
require_relative './flag'

require_relative './basic_instruction_type'
require_relative './basic_instruction'
require_relative './non_basic_instruction'
require_relative './non_basic_instruction_type'

require_relative './label'
require_relative './label_declaration'

require_relative './instruction'
require_relative './codeline'
require_relative './program'

require_relative './dcpu16_grammar'

raise "Need a source!" if ARGV.first.nil?
dest = ARGV.first

Treetop.load "dcpu16_grammar"

source = <<ASM
  ; Try some basic stuff
                SET A, 0x30              ; 7c01 0030
                SET [0x1000], 0x20       ; 7de1 1000 0020
                SUB A, [0x1000]          ; 7803 1000
                IFN A, 0x10              ; c00d 
                   SET PC, crash         ; 7dc1 001a [*]
                
  ; Do a loopy thing
                SET I, 10                ; a861
                SET A, 0x2000            ; 7c01 2000
  :loop         SET [0x2000+I], [A]      ; 2161 2000
                SUB I, 1                 ; 8463
                IFN I, 0                 ; 806d
                   SET PC, loop          ; 7dc1 000d [*]
  
  ; Call a subroutine
                SET X, 0x4               ; 9031
                JSR testsub              ; 7c10 0018 [*]
                SET PC, crash            ; 7dc1 001a [*]
  
  :testsub      SHL X, 4                 ; 9037
                SET PC, POP              ; 61c1
                  
  ; Hang forever. X should now be 0x40 if everything went right.
  :crash        SET PC, crash            ; 7dc1 001a [*]
ASM

parser = Dcpu16AsmParser.new
if program = parser.parse(source)
  program.compile(dest)
else
    p parser.failure_reason
end
