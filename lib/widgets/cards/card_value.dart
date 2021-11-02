import 'package:engage_library/utils/engage_item.dart';
import 'package:engage_library/widgets/cards/card.dart';
import 'package:flutter/material.dart';

class EngageCardValue extends StatelessWidget {
  final bool isLoading;
  final EngageItemModel item;
  const EngageCardValue({
    Key? key,
    required this.item,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EngageCard(
      child: Column(
        children: [
          Text(
            item.name ?? '',
            style: Theme.of(context).textTheme.headline2,
          ),
          if (isLoading)
            Container(
              height: 30,
              padding: EdgeInsets.only(top: 8),
              child: SizedBox(
                height: 14,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            )
          else
            Text(
              item.value ?? '',
              style: Theme.of(context).textTheme.headline3,
            ),
        ],
      ),
    );
  }
}
