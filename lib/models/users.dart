class CUser {
  String? name;
  String? email;
  String? uid;

  CUser({
    this.email,
    this.uid,
    this.name,
  });

  CUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    return {"uid": uid, "email": email, "name": name};
  }
}
