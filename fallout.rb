#!/usr/bin/ruby
def hamming(op1, op2)
  i = 0
  op1.chars.zip(op2.chars) { |c| i += 1 if c[0] == c[1] }
  i
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

1.upto passwords.length do
  print "Enter password and number of correct letters\n> "
  line = $stdin.gets
  if line.nil? then
    $stderr.puts "Empty input"
    exit 0
  end

  entered, correct = line.downcase.split /\W+/
  unless passwords.include? entered
    $stderr.puts "#{entered} is not in the list of possible passwords"
    exit 3
  end

  passwords.delete entered
  passwords.dup.each do |password|
    if hamming(password, entered) != correct.to_i then
      passwords.delete password
    end
  end

  num = passwords.length
  if num > 1 then
    puts "Possible passwords: #{passwords.join(' ')}"
  elsif num == 1 then
    puts "The password is: #{passwords[0]}"
    exit 0
  else
    $stderr.puts 'No more passwords left'
    exit 4
  end
end
