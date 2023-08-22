import 'package:flutter/material.dart';

class BankDetailsWidget extends StatelessWidget {
  const BankDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
              text: 'Beneficiary Bank: ',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 14),
              children: [
                TextSpan(
                    text:
                        'BENEFICIARY BANK: ZHEJIANG TAILONG COMMERCIAL BANK CO.,LTD',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14))
              ])),
          const SizedBox(
            height: 10,
          ),
          Text.rich(TextSpan(
              text: 'SWIFT Code: ',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 14),
              children: [
                TextSpan(
                    text: 'ZITLCNBH',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14))
              ])),
          const SizedBox(
            height: 10,
          ),
          Text.rich(TextSpan(
              text: 'Beneficiary Name: ',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 14),
              children: [
                TextSpan(
                    text: 'YIWU ZHENGLI IMPORT AND EXPORT CO., LIMITED',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14))
              ])),
          const SizedBox(
            height: 10,
          ),
          Text.rich(TextSpan(
              text: 'Account No: ',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 12),
              children: [
                TextSpan(
                    text: 'NRA33080020201000002413',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14))
              ])),
          const SizedBox(
            height: 10,
          ),
          Text.rich(TextSpan(
              text: 'Bank Address: ',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 14),
              children: [
                TextSpan(
                    text:
                        'NO.1401, CHOUZHOU NORTH ROAD, YIWU CITY, ZHEJIANG, 322000 CHINA',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14))
              ])),
        ],
      ),
    );
  }
}
