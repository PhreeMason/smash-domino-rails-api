json.chatrooms @chatrooms do |chatroom|
  json.id chatroom.id
  json.name chatroom.name
  json.members chatroom.chatroom_users.count
end

json.messages @messages