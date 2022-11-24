import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class NotificationItem extends StatelessWidget {
  final String countItem;
  Function()? onPressed;
  bool showCountItem = false;

  NotificationItem({
    super.key,
    required this.countItem,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Badge(
        showBadge: int.parse(countItem) >= 1 ? true : false,
        position: BadgePosition(bottom: 10, end: 9),
        badgeContent: Text(
          countItem,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        badgeColor: Colors.red,
        child: Image.asset(
          'lib/images/03.png',
          scale: 7,
        ),
      ),
    );
  }
}
