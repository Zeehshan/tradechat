import 'package:flutter/material.dart';
import 'package:tradechat/ui/widgets/network_image_widget.dart';

import 'widgets.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 88,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(.2),
                  offset: const Offset(0, 0))
            ]),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.only(left: 10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 2,
                          color: Colors.grey.withOpacity(.6),
                          offset: const Offset(0, 0))
                    ],
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: NetworkImageWidget(
                  width: 60,
                  height: 60,
                  borderRadius: 100,
                  imageUrl: null,
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              LatestMessagedWidget(
                documentId: '',
                name: 'Imaad',
              )
            ],
          ),
        ));
  }
}
