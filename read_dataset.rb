# frozen_string_literal: true

require 'csv'

# read dataset from .csv file and returns hash
def read_dataset(file_name)
  CSV.parse(File.read("#{file_name}.csv"), headers: true)
end
