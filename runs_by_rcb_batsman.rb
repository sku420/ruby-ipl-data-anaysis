# frozen_string_literal: true

require_relative 'plot_graph'
require_relative 'read_dataset'
include Graph

# main method
def runs_by_rcb_batsman_main
  # read dataset from .csv file
  deliveries_dataset = read_dataset('deliveries')

  # hash to store rcb batsmans and their scores
  rcb_batsman = Hash.new(0)

  # extracting required data from dataset: [batsman] => runs
  deliveries_dataset.each do |team|
    rcb_batsman[team['batsman']] += team['batsman_runs'].to_i if team['batting_team'] == 'Royal Challengers Bangalore'
  end
  # puts rcb_batsman, rcb_batsman.length

  # getting top 10 batsman from the extracted data
  top10 = rcb_batsman.sort_by { |_key, value| -value }[0..9].to_h
  # puts top10

  # hash to store batsman name for graph labeling
  batsman_name = {}

  # names as graph label
  top10.each_with_index { |(key, _), label_index| batsman_name[label_index] = key.split(' ')[1].to_s[0..5] }

  # puts batsman_name

  # plot_bar_graph method call
  Graph.plot_bar_graph('RCB_Batsman-Run-Bar-Graph', 'Batsman', 'Runs', top10, batsman_name)
end
