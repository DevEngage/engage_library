/* 
  TODO:
  [ ] Search by local (whole collection)
  [ ] Search by Algolia (requires backend trigger)
 */

import 'package:engage_library/utils/engagefire_collection.dart';

class EngagefireSearch {
  final String path;
  late EngagefireCollection collection;
  EngagefireSearch({required this.path}) {
    this.collection = EngagefireCollection(path: path);
  }

  cache(List? fields) {
    // store collection plus fields in getstorage
  }

  search([String term = '']) {
    // search local
  }
}
