total_distance = 0
id1 = []
id2 = []

input = File.open('input').read.split("\n")
input.each do |line|
  ids = line.split("   ")
  id1 << ids[0].to_i
  id2 << ids[1].to_i
end

id1.sort!
id2.sort!

input.each_index do |i|
  if id1[i] > id2[i]
    d = id1[i] - id2[i]
  else
    d = id2[i] - id1[i]
  end
  total_distance += d
end

puts total_distance