// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      email: json['email'] as String?,
      userId: json['userId'] as String?,
      userType: (json['userType'] as num?)?.toInt(),
      phone: json['mobileNumber'] as String?,
      userName: json['userName'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'userType': instance.userType,
      'userId': instance.userId,
      'email': instance.email,
      'mobileNumber': instance.phone,
      'userName': instance.userName,
      'isActive': instance.isActive,
    };
