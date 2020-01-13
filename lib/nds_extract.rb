$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

pp directors_database

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
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
  director_name = source[row_index][:name]
  while row_index < source.length do 
    directors.push(director_name)
    row_index += 1 
  end
  directors 
end

def total_gross(source)
  grand_total = 0 
  row_index = 0 
  director_gross = directors_totals(source)
  director_name = list_of_directors[row_index]
  while row_index < source.length do
    list_of_directors[row_index] = director_gross[director_name]
    grand_total += list_of_directors[row_index]
    row_index +1 
  end
  grand_total
end

