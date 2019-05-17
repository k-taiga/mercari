require 'csv'

CSV.read("db/csv/category.csv", headers: true).each do |column|
  user = Category.create!(
    id: column['id'],
    name: column['name'],
    created_at: column['created_at'],
    updated_at: column['updated_at'],
  )
end

CSV.read("db/csv/brand.csv", headers: true).each do |column|
  user = Brand.create!(
    id: column['id'],
    name: column['name'],
    created_at: column['created_at'],
    updated_at: column['updated_at']
  )
end
