import 'package:flutter/material.dart';

Future<void> engageConfirmWidget(BuildContext context,
    {onAgreed, onCancled, title = '', message = '', confirmText = 'Confirm'}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel', style: TextStyle(color: Colors.red)),
            onPressed: () {
              if (onCancled != null) onCancled();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(confirmText),
            onPressed: () {
              if (onAgreed != null) onAgreed();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
