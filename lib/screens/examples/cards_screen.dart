import 'package:engage_library/utils/engage_item.dart';
import 'package:engage_library/utils/engagefire_doc.dart';
import 'package:engage_library/widgets/cards/card_notification.dart';
import 'package:engage_library/widgets/cards/card_progress.dart';
import 'package:engage_library/widgets/cards/card_value.dart';
import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Text('Cards'),
        EngagefireDoc(path: 'Test', id: 'test').$watchBuilder((doc) {
          print(doc);
          return EngageCardValue(
            item: EngageItemModel(name: 'Calories', value: '200'),
          );
        }),
        EngageCardNotification(
          title: 'Notification Card',
          description: '1000',
        ),
        EngageCardProgress(
          title: 'Notification Card',
          value: '1000',
        ),
      ],
    ));
  }
}
