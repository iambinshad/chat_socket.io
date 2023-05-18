class MessagesModel {
    bool? myself;
    String? message;

    MessagesModel({
        this.myself,
        this.message,
    });

    factory MessagesModel.fromJson(Map<String, dynamic> json) => MessagesModel(
        myself: json["myself"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "myself": myself,
        "message": message,
    };
}