require 'treetop'
require_relative './dcpu16_grammar'

Treetop.load "dcpu16_grammar"

program = <<ASM
  ; Try some basic stuff
  SET A, 0x30              ; 7c01 0030
  SET [0x1000], 0x20       ; 7de1 1000 0020
  SUB A, [0x1000]          ; 7803 1000
  IFN A, 0x10              ; c00d 
     SET PC, crash         ; 7dc1 001a [*]
  SET I, 0x0

  ; Do a loopy thing
ASM

parser = Dcpu16AsmParser.new
if parser.parse(program)
    puts 'success'
else
    puts parser.failure_reason
end
