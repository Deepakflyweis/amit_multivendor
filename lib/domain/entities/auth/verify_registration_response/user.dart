class User {
  String? id;
  String? name;
  String? phone;
  String? role;
  bool? verified;
  String? createdAt;
  int? v;

  User({
    this.id,
    this.name,
    this.phone,
    this.role,
    this.verified,
    this.createdAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        role: json['role'] as String?,
        verified: json['verified'] as bool?,
        createdAt: json['createdAt'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'phone': phone,
        'role': role,
        'verified': verified,
        'createdAt': createdAt,
        '__v': v,
      };
}
