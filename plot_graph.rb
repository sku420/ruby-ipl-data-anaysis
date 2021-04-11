# frozen_string_literal: true

require 'gruff'
# module to plot graph later used in programs
module Graph
  # method to plot graph
  def plot_bar_graph(title, axis_x, axis_y, data, label)
    graph = Gruff::Bar.new('1080x720')
    graph.theme = Gruff::Themes::RAILS_KEYNOTE
    graph.title = title
    graph.x_axis_label = axis_x
    graph.y_axis_label = axis_y
    graph.minimum_value = 0
    graph.labels = label
    graph.data('', data.values)
    graph.write("#{title}.png")
  end

  # method to plot side bar graph
  def plot_side_bar_graph(title, axis_x, axis_y, data, label)
    graph = Gruff::Bar.new('1440x1080')
    graph.theme = Gruff::Themes::RAILS_KEYNOTE
    graph.title = title
    graph.x_axis_label = axis_x
    graph.y_axis_label = axis_y
    graph.y_axis_increment = 4
    graph.minimum_value = 0
    graph.labels = label
    data.each { |team, matches| graph.data(team, matches) }
    graph.write("#{title}.png")
  end
end
