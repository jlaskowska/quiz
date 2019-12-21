import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final String titleLabel;
  final Color borderColor;
  final IconData icon;
  final Color iconColor;
  final Function onTap;

  const BaseCard({
    @required this.titleLabel,
    @required this.borderColor,
    @required this.icon,
    @required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 5,
          color: borderColor,
        ),
      ),
      child: ListTile(
        leading: Text(
          titleLabel,
          style: TextStyle(fontSize: 20),
        ),
        trailing: Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
        onTap: onTap,
      ),
    );
  }
}
