import 'package:engage_library/models/engagefire_doc_model.dart';

class EngageProfileModel extends EngagefireDocModel {
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
