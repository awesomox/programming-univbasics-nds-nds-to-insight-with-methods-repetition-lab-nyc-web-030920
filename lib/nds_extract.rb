$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

pp directors_database

def directors_totals(source)
  result = {}
  row_index = 0
  while row_index < source.size do
    director = source[row_index]
    result[director[:name]] = gross_for_director(director)
    row_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  directors = [] 
  row_index = 0 
  while row_index < source.length do 
    directors << source[row_index][:name] 
    row_index += 1 
  end
  directors 
end

def total_gross(source) 
  grand_total = 0 
  row_index = 0 
  while row_index < source.length do
    director_name = list_of_directors(source)[row_index]
    grand_total += directors_totals(source)[director_name]
    row_index += 1
  end
  return grand_total
end

total_gross(directors_database)

