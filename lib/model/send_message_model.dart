class MessageModel{
  String? from;
  String? to;
  String? message;

  MessageModel({required this.from,required this.to,required this.message});

  MessageModel.fromMap(Map<String,dynamic>map){
    from = map["from"];
    message = map["message"];
    to = map["to"];
  }

  Map<String,dynamic>tojson(){
    return{
      "from":from,
      "message":message,
      "to":to,
      
    };
  }
}
