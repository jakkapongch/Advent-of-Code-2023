datas = File.read('./data.txt').split("\n")

result = datas.map do |data|
  number_only = data.gsub(/\D/, '')
  "#{number_only.chars.first}#{number_only.chars.last}".to_i
end

p result.sum
