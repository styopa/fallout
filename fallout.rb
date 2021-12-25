#!/usr/bin/ruby
def hamming(op1, op2)
end

passwords = ARGV.map { |password| password.downcase }

if passwords.length < 1
  $stderr.puts <<~EOF
    Too few arguments: #{passwords.length}
    USAGE: #$0 PASSWORD PASSWORD...
  EOF
  exit 1
end

len_first = passwords[0].length
passwords.each do |password|
  if password.length != len_first
    $stderr.puts "Passwords are of different length: '%s' and '%s'" \
      % [passwords[0], password]
    exit 2
  end
end
