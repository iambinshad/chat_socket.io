
// class VendorChatListModel {
//     List<SortedUser>? sortedUsers;
//     List<ConnectionCount>? connectionCount;

//     VendorChatListModel({
//         this.sortedUsers,
//         this.connectionCount,
//     });

//     factory VendorChatListModel.fromJson(Map<String, dynamic> json) => VendorChatListModel(
//         sortedUsers: json["sortedUsers"] == null ? [] : List<SortedUser>.from(json["sortedUsers"]!.map((x) => SortedUser.fromJson(x))),
//         connectionCount: json["connectionCount"] == null ? [] : List<ConnectionCount>.from(json["connectionCount"]!.map((x) => ConnectionCount.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "sortedUsers": sortedUsers == null ? [] : List<dynamic>.from(sortedUsers!.map((x) => x.toJson())),
//         "connectionCount": connectionCount == null ? [] : List<dynamic>.from(connectionCount!.map((x) => x.toJson())),
//     };
// }

// class ConnectionCount {
//     String? userId;
//     int? count;

//     ConnectionCount({
//         this.userId,
//         this.count,
//     });

//     factory ConnectionCount.fromJson(Map<String, dynamic> json) => ConnectionCount(
//         userId: json["userId"],
//         count: json["count"],
//     );

//     Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "count": count,
//     };
// }

// class SortedUser {
//     String? id;
//     String? fullName;
//     String? userName;
//     String? email;
//     int? phone;
//     String? status;
//     DateTime? date;
//     int? v;
//     dynamic dob;
//     dynamic gender;
//     dynamic location;
//     String? profilePhoto;

//     SortedUser({
//         this.id,
//         this.fullName,
//         this.userName,
//         this.email,
//         this.phone,
//         this.status,
//         this.date,
//         this.v,
//         this.dob,
//         this.gender,
//         this.location,
//         this.profilePhoto,
//     });

//     factory SortedUser.fromJson(Map<String, dynamic> json) => SortedUser(
//         id: json["_id"],
//         fullName: json["fullName"],
//         userName: json["userName"],
//         email: json["email"],
//         phone: json["phone"],
//         status: json["status"],
//         date: json["date"] == null ? null : DateTime.parse(json["date"]),
//         v: json["__v"],
//         dob: json["dob"],
//         gender: json["gender"],
//         location: json["location"],
//         profilePhoto: json["profilePhoto"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "fullName": fullName,
//         "userName": userName,
//         "email": email,
//         "phone": phone,
//         "status": status,
//         "date": date?.toIso8601String(),
//         "__v": v,
//         "dob": dob,
//         "gender": gender,
//         "location": location,
//         "profilePhoto": profilePhoto,
//     };
// }

class VendorChatListModel {
  List<SortedVendor>? sortedUsers;
  List<ConnectionCountV> connectionCount;

  VendorChatListModel({
    required this.sortedUsers,
    required this.connectionCount,
  });

  factory VendorChatListModel.fromJson(Map<String, dynamic> json) {
    return VendorChatListModel(
      sortedUsers: List<SortedVendor>.from(
          json['sortedUsers'].map((x) => SortedVendor.fromJson(x))),
      connectionCount: List<ConnectionCountV>.from(
          json['connectionCount'].map((x) => ConnectionCountV.fromJson(x))),
    );
  }
}

class ConnectionCountV {
  String userId;
  int count;

  ConnectionCountV({
    required this.userId,
    required this.count,
  });

  factory ConnectionCountV.fromJson(Map<String, dynamic> json) {
    return ConnectionCountV(
      userId: json['userId'],
      count: json['count'],
    );
  }
}

class SortedVendor {
  String id;
  String fullName;
  String userName;
  String email;
  int phone;
  String status;
  DateTime date;
  int v;
  dynamic dob;
  dynamic gender;
  dynamic location;
  String profilePhoto;

  SortedVendor({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.email,
    required this.phone,
    required this.status,
    required this.date,
    required this.v,
    required this.dob,
    required this.gender,
    required this.location,
    required this.profilePhoto,
  });

  factory SortedVendor.fromJson(Map<String, dynamic> json) {
    return SortedVendor(
      id: json['_id'],
      fullName: json['fullName'],
      userName: json['userName'],
      email: json['email'],
      phone: json['phone'],
      status: json['status'],
      date: DateTime.parse(json['date']),
      v: json['__v'],
      dob: json['dob'],
      gender: json['gender'],
      location: json['location'],
      profilePhoto: json['profilePhoto'],
    );
  }
}