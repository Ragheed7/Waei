import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  int? userType;
  String? userId;
  String? email;
  @JsonKey(name: "mobileNumber")
  String? phone;
  String? userName;
  bool? isActive;

  UserData({
    this.email,
    this.userId,
    this.userType,
    this.phone,
    this.userName,
    this.isActive,
  });

  // copyWith method
  UserData copyWith({
    int? userType,
    String? userId,
    String? email,
    String? phone,
    String? userName,
    bool? isActive,
  }) {
    return UserData(
      userType: userType ?? this.userType,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      userName: userName ?? this.userName,
      isActive: isActive ?? this.isActive,
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
