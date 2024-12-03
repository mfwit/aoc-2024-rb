safeCount = 0
input = File.open('test').read.split("\n")
input.each do |report|
  incUnsafe = 0
  decrUnsafe = 0
  safe = false
  levels = report.split(" ")
  levels.each_index do |l|
    if l > 0
      diff = (levels[l].to_i - levels[l-1].to_i).abs
      if levels[l].to_i <= levels[l-1].to_i || diff > 3
        incUnsafe += 1
      end
      if levels[l].to_i >= levels[l-1].to_i || diff > 3
        decrUnsafe += 1
      end
    end
  end
  if incUnsafe <= 1 || decrUnsafe <= 1
    safe = true
    safeCount += 1
  end
  puts "#{levels}: safe? #{safe} #{incUnsafe} #{decrUnsafe}"
end
puts safeCount
