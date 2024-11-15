import 'dart:convert';

class LocalAuthJson {
  int? userId;
  String? email;
  String? username;
  String? dob;
  String? gender;
  String? address;
  String? department;
  String? division;
  String? role;
  String? avatar;
  int? companyId;
  List? shortcutMenu;

  LocalAuthJson({
    this.userId,
    this.email,
    this.username,
    this.dob,
    this.gender,
    this.address,
    this.department,
    this.division,
    this.role,
    this.avatar,
    this.companyId,
    this.shortcutMenu,
  });

  String simplify() => jsonEncode({
    "user_id": userId,
    "email": email,
    "username": username,
    "dob": dob,
    "gender": gender,
    "address": address,
    "department": department,
    "division": division,
    "role": role,
    "avatar": avatar,
    "company_id": companyId,
    "shortcut_menu": shortcutMenu,
  });

  static LocalAuthJson obscure({String? source}) {
    LocalAuthJson result = LocalAuthJson();

    if(source != null) {
      Map<String, dynamic> data = jsonDecode(source);

      result = LocalAuthJson(
        userId: data["user_id"],
        email: data["email"],
        username: data["username"],
        dob: data["dob"],
        gender: data["gender"],
        address: data["address"],
        department: data["department"],
        division: data["division"],
        role: data["role"],
        avatar: data["avatar"],
        companyId: data["company_id"],
        shortcutMenu: data["shortcut_menu"],
      );
    }

    return result;
  }
}