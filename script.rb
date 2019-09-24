require 'csv'
table = CSV.parse(File.read("db.csv"), headers: true)

# File.open('food.json', 'a') do |file|
#   file.puts "["
#   (0..table.size).each do |index|
#     file.puts "{ \"id\": #{index + 1},  \"name \":  \"#{table[index]['Food Name']} \" }," rescue ''
#   end
#   file.puts "]"
# end

keys_to_exclude = ["Food ID", "Food Name"]
n_index = 1
File.open('nutrition12.json', 'a') do |file|
  file.puts "["
  (0..table.size).each do |index|
    begin
      data = table.by_row[index].to_hash

      data.keys.each do |key|
        unless keys_to_exclude.include?(key)
          file.puts "{ \"id\": #{n_index}, \"foodId\": #{index + 1},  \"name \":  \"#{key} \",\"value \":  \"#{data[key]} \" }," rescue ''
          n_index += 1
        end
      end
    rescue
      puts "Error on #{index}"
    end
    end

  file.puts "]"
end

