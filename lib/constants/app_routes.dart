import 'package:engage_library/enum/types.dart';
import 'package:engage_library/models/field_list_model.dart';
import 'package:engage_library/models/field_model.dart';
import 'package:engage_library/screens/add_screen.dart';
import 'package:engage_library/screens/admin_screen.dart';
import 'package:engage_library/screens/home_screen.dart';
import 'package:engage_library/screens/login_screen.dart';
import 'package:engage_library/screens/model_manage_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(name: '/', page: () => EngageHomeScreen()),
    GetPage(name: '/login', page: () => EngageLoginScreen()),
    GetPage(name: '/admin', page: () => EngageAdminScreen()),
    GetPage(name: '/admin-manage-model', page: () => EngageModelManageScreen()),
    GetPage(
        name: '/admin-add-models',
        page: () => EngageAddScreen(path: 'engageModels', fields: [
              FieldModel(name: 'Field Name'),
              FieldModel(name: 'Default Value'),
              FieldModel(
                name: 'multiselect',
                type: FieldType.multiselect,
                list: FieldListModel.inputFieldList,
              ),
            ])),
    GetPage(
        name: '/admin-add-collections',
        page: () => EngageAddScreen(path: 'engageCollections')),
  ];
}
