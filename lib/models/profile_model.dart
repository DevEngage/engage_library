class ProfileModel {
  String? id;
  String? name;
  String? email;

  ProfileModel();

  ProfileModel.blank();

  ProfileModel.fromJson(Map data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
