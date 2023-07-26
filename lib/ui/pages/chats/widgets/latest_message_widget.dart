import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LatestMessagedWidget extends StatelessWidget {
  final String documentId;
  final String name;
  const LatestMessagedWidget(
      {super.key, required this.documentId, required this.name});

  @override
  Widget build(BuildContext context) {
    String date = '';
    final DateTime messageData = DateTime.now();

    date =
        '${DateFormat.MMMd().format(messageData)} ${DateFormat.jm().format(messageData)}';
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 14),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text.rich(
                TextSpan(children: [
                  // WidgetSpan(
                  //     child: Padding(
                  //   padding: const EdgeInsets.only(
                  //     bottom: 3.5,
                  //     right: 4,
                  //   ),
                  //   child: FaIcon(FontAwesomeIcons.timeline),
                  // )),
                  TextSpan(text: date)
                ]),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 12),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'latest message',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
