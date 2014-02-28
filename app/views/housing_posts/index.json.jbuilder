json.array! @posts do |post|
  json.title post.title
  json.beds post.beds
  json.rent post.rent
  json.post_date_time post.post_date_time
  json.specific_location post.specific_location
  json.url post.url
  json.medium_pics post.medium_pics
  json.latitude post.latitude
  json.longitude post.longitude
  json.watched? post.watched?(current_user)
end