class EngageProfileModel {
  String? id;
  String? name;
  String? email;

  EngageProfileModel();

  EngageProfileModel.blank();

  EngageProfileModel.fromJson(Map data) {
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
