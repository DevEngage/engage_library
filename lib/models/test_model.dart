import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:engage_library/utils/engagefire_doc.dart';

@jsonSerializable
class TestModel extends EngagefireDoc {
  @JsonProperty(name: 'name')
  String? name;

  @JsonProperty(name: 'test')
  String? test;

  TestModel() : super(path: 'Test');
}
