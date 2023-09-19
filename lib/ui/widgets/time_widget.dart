import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';

class TimeWidget extends StatelessWidget {
  final DateTime createdAt;
  final Color? color;
  const TimeWidget({super.key, required this.createdAt, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(GetTimeAgo.parse(createdAt, locale: 'en', pattern: 'yMd'),
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: 10,
              color: color,
            ));
  }
}
