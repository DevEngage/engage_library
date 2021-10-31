import 'package:engage_library/widgets/cards/card.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  const NotificationCard(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EngageCard(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 4, right: 10),
                  child: CustomPaint(
                    painter: DrawCircle(),
                  ),
                ),
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                description,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawCircle extends CustomPainter {
  late Paint _paint;

  DrawCircle() {
    _paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0.0, 0.0), 5.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
