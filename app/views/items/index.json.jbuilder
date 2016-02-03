json.array! @items do |item|
  json.extract! item, :id, :name
  item.description.each do |k,v|
    json.set! k, v
  end
end
