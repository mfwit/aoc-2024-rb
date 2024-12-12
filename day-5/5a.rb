input = File.open('test').read.split("\n\n")
rules = input[0].split("\n")
updates = input[1].gsub(/\n/, ',').split(",")
rulesO = []

rules.each do |rule|
  a = rule.split("|")[0].to_i
  b = rule.split("|")[1].to_i
  if updates.include?(a) && updates.include?(b)
    rulesO[a] << b
  end
  puts rulesO
end