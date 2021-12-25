#!/usr/bin/ruby
def hamming(op1, op2)
end

passwords = ARGV.map { |p| p.downcase }

if passwords.length < 1
  $stderr.puts "Too few arguments: #{passwords.length}"
  $stderr.puts "USAGE: #$0 PASSWORD PASSWORD..."
  exit 1
end
