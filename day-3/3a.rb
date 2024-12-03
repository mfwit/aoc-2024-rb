result = 0
input = File.open('input').read
input.scan(/mul\((\d+),(\d+)\)/) do |x,y|
  val = x.to_i*y.to_i
  result += val
end
puts result