totalSimScore = 0
idL = []
idR = []

input = File.open('input').read.split("\n")
input.each do |line|
  ids = line.split("   ")
  idL << ids[0].to_i
  idR << ids[1].to_i
end

idL.each do |n|
  fCount = idR.select{|num| num == n}.count
  simScore = fCount * n
  totalSimScore += simScore
end

puts totalSimScore