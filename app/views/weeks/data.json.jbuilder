json.array! @weeks do |week|
  json.id_category week.id_category
  json.category week.category
  json.cost week.cost
  json.categories week.days, :id_category, :category, :cost
end
