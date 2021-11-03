import 'package:engage_library/widgets/cards/card.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class EngageCardProgress extends StatelessWidget {
  final String title;
  final String value;
  final bool isLoading;
  const EngageCardProgress({
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
            GFProgressBar(
              // percentage: double.parse(value),
              lineHeight: 20,
              alignment: MainAxisAlignment.spaceBetween,
              child: const Text(
                '80%',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              leading:
                  Icon(Icons.sentiment_dissatisfied, color: GFColors.DANGER),
              trailing:
                  Icon(Icons.sentiment_satisfied, color: GFColors.SUCCESS),
              backgroundColor: Colors.black26,
              progressBarColor: GFColors.INFO,
            )
        ],
      ),
    );
  }
}
