input_path = File.expand_path("data.txt", File.dirname(__FILE__))

CONFIGURATION = {
  "red" => 12,
  "green" => 13,
  "blue" => 14
}

valid_game_ids = File.readlines(input_path).each_with_object([]) do |line, ids|
  parsed = line.match(/^Game (\d+):\s+(.+)$/)

  id = parsed[1].to_i
  rounds = parsed[2].split(";").map(&:strip)

  next unless rounds.all? do |round|
    round.split(",").map(&:strip).all? do |color|
      count, color = color.split(" ")
      CONFIGURATION[color] >= count.to_i
    end
  end

  ids << id
end

puts "The valid game IDs add up to: #{valid_game_ids.sum}"

# Part 2
powers = File.readlines(input_path).map do |line|
  red = line.scan(/\d+ red/).flatten.map(&:to_i).max
  green = line.scan(/\d+ green/).flatten.map(&:to_i).max
  blue = line.scan(/\d+ blue/).flatten.map(&:to_i).max

  red * green * blue
end

puts "The sum of the powers is: #{powers.sum}"
