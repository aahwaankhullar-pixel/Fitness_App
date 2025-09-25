import 'package:hive/hive.dart';
part "User.g.dart";
@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String nickname;

  @HiveField(1)
  String avatar;

  @HiveField(2)
  String syndrome;

  User({required this.nickname, required this.avatar,required this.syndrome});
}