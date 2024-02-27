class UserModel {
  UserModel({
    required this.email,
    required this.role,
    required this.balanse,
    required this.fullName,
    required this.image,
    required this.phone,
    required this.isBlocked,
    required this.birthday,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(dynamic json) {
    var email = json['email'];
    var role = json['role'];
    var balanse = json['balanse'];
    var fullName = json['full_name'];
    var image = json['image'];
    var phone = json['phone'];
    var isBlocked = json['is_blocked'];
    var birthday = json['birthday'];
    var id = json['id'];
    var createdAt = json['created_at'];
    var updatedAt = json['updated_at'];
    return UserModel(
        email: email,
        role: role,
        balanse: balanse,
        fullName: fullName,
        image: image,
        phone: phone,
        isBlocked: isBlocked,
        birthday: birthday,
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  String email;
  int role;
  double balanse;
  String fullName;
  String? image;
  String? phone;
  bool isBlocked;
  String? birthday;
  int id;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['role'] = role;
    map['balanse'] = balanse;
    map['full_name'] = fullName;
    map['image'] = image;
    map['phone'] = phone;
    map['is_blocked'] = isBlocked;
    map['birthday'] = birthday;
    map['id'] = id;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
