# frozen_string_literal: true

require_relative 'plot_graph'
require_relative 'read_dataset'
include Graph

# reduce country name to their abbr: West Indies => WI, Australia => AUS
def short_country_name(name)
  if name.include? ' '
    temp = name.split(' ')
    temp[0][0] + temp[1][0]
  else
    name[0..2].upcase
  end
end

# main method
def umpires_nationality_main
  # read dataset from .csv file
  umpires_dataset = read_dataset('umpires')

  # hash to store umpires by nationality
  foreign_umpires = Hash.new(0)

  # extracting required data from dataset [nationality] => umpires count
  umpires_dataset.each do |umpire|
    country = short_country_name(umpire['Nationality'])
    foreign_umpires[country] += 1 if umpire['Nationality'] != 'India'
  end

  # hash to store nationality for graph labeling
  country = {}

  # nationality as graph label:
  foreign_umpires.each_with_index { |(key, _), label_index| country[label_index] = key }
  # puts country

  # plot_bar_graph method call
  Graph.plot_bar_graph('Nationality-Umpire-Bar-Graph', 'Country Origin', 'No. of umpires', foreign_umpires, country)
end
