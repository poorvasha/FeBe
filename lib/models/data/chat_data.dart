
class ChatMessage{
  String name;
  String messageContent;
  String messageType; 
  DateTime dateTime;
  ChatMessage({required this.name, required this.messageContent, required this.messageType, required this.dateTime});
}

class ChatJoinerData {
    String? userId;
    String? name;
    String? targetUserId;

    ChatJoinerData({this.userId, this.name, this.targetUserId}); 

    ChatJoinerData.fromJson(Map<String, dynamic> json) {
        userId = json['userId'];
        name = json['name'];
        targetUserId = json['targetUserId'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['userId'] = userId;
        data['name'] = name;
        data['targetUserId'] = targetUserId;
        return data;
    }
}


class ChatMessageSendingData {
    String? userId;
    String? name;
    String? targetUserId;
    String? message;

    ChatMessageSendingData({this.userId, this.name, this.targetUserId, this.message}); 

    ChatMessageSendingData.fromJson(Map<String, dynamic> json) {
        userId = json['userId'];
        name = json['name'];
        targetUserId = json['targetUserId'];
        message = json['message'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['userId'] = userId;
        data['name'] = name;
        data['targetUserId'] = targetUserId;
        data['message'] = message;
        return data;
    }
}


class  ChatMessageRecievingData{
    String? username;
    String? message;

    ChatMessageRecievingData({this.username, this.message}); 

    ChatMessageRecievingData.fromJson(Map<String, dynamic> json) {
        username = json['username'];
        message = json['message'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['username'] = username;
        data['message'] = message;
        return data;
    }
}