import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String caption;
  final VoidCallback onTap;

  const ActionButton({@required this.caption, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: FlatButton(
        child: Text(
          caption.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
