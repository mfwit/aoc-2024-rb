require 'strscan'
enableS = []
result = 0

input = File.open('input').read
s = StringScanner.new(input)
while !s.eos?
  if s.check_until(/don\'t\(\)/)
    enableS << s.scan_until(/don\'t\(\)/)
    s.skip_until(/do\(\)/)
  else
    enableS << s.rest
    s.terminate
  end
end
enableS.each do |s|
  s.scan(/mul\((\d+),(\d+)\)/) do |x,y|
    val = x.to_i*y.to_i
    result += val
  end
end
puts result