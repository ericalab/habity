require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(title impression created_at)
  csv << csv_column_names
  @hobbies.each do |hobby|
    column_values = [
      hobby.title,
      hobby.impression,
    ]
    csv << column_values
  end
end
