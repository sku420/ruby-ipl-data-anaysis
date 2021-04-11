# frozen_string_literal: true

require_relative 'read_dataset'
require_relative 'plot_graph'
include Graph

# reduce team name to their abbr: Kolkata Knight Riders => KKR
def short_team_name(team_name)
  temp = team_name.split(' ')
  temp.length == 3 ? temp[0][0] + temp[1][0] + temp[2][0] : temp[0][0] + temp[1][0]
end

# main method
def total_runs_by_team_main
  # read dataset from .csv file
  deliveries_dataset = read_dataset('deliveries')

  # hash to store aggregated total runs by team
  total_runs_by_team = Hash.new(0)

  # process data to get required data: teams => total runs
  deliveries_dataset.each do |team|
    team_name = short_team_name(team['batting_team'])
    total_runs_by_team[team_name] += team['total_runs'].to_i
  end
  # puts total_runs_by_team

  # hash to store team names for graph label
  team_name = {}

  # process data for graph labeling
  total_runs_by_team.each_with_index { |(key, _), label_index| team_name[label_index] = key }

  # puts team_name

  # plot_bar_graph method call
  Graph.plot_bar_graph('Team-Run-Bar-Graph', 'Teams', 'Runs', total_runs_by_team, team_name)
end
