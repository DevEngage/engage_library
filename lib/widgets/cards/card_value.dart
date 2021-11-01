import 'package:engage_library/widgets/cards/card.dart';
import 'package:flutter/material.dart';

class EngageCardValue extends StatelessWidget {
  final String title;
  final String value;
  final bool isLoading;
  const EngageCardValue({
    Key? key,
    required this.title,
    required this.value,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EngageCard(
      child: Column(
        children: [
          Text(
            title,
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
              value,
              style: Theme.of(context).textTheme.headline3,
            ),
        ],
      ),
    );
  }
}
