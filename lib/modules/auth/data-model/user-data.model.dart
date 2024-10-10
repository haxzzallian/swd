class UserDataModel {
  String sessionId;
  String id;
  String username;
  String? firstName;
  String userId;
  String password;
  String email;
  String userType;
  bool isLoggedIn;
  bool canPost;
  bool isBlocked;
  bool isVerified;
  String accessToken;
  String? inviteCode;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  UserDataModel({
    required this.sessionId,
    required this.id,
    required this.username,
    required this.firstName,
    required this.userId,
    required this.password,
    required this.email,
    required this.userType,
    required this.isLoggedIn,
    required this.canPost,
    required this.isBlocked,
    required this.isVerified,
    required this.accessToken,
    required this.inviteCode,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        sessionId: json["session_id"],
        id: json["_id"],
        username: json["username"],
        firstName: json["first_name"],
        userId: json["user_id"],
        password: json["password"],
        email: json["email"],
        userType: json["user_type"],
        isLoggedIn: json["is_loggedIn"],
        canPost: json["can_post"],
        isBlocked: json["is_blocked"],
        isVerified: json["is_verified"],
        accessToken: json["access_token"],
        inviteCode: json["invite_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "session_id": sessionId,
        "_id": id,
        "username": username,
        "first_name": firstName,
        "user_id": userId,
        "password": password,
        "email": email,
        "user_type": userType,
        "is_loggedIn": isLoggedIn,
        "can_post": canPost,
        "is_blocked": isBlocked,
        "is_verified": isVerified,
        "access_token": accessToken,
        "invite_code": inviteCode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "__v": v,
      };
}
