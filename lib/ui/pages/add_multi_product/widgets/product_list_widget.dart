import 'package:flutter/material.dart';

import 'widgets.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Table(
        border: null,
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(),
          4: FlexColumnWidth(),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              Text(
                'Product',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'Quantity',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'Price',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'Total',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'Action',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          ...List.generate(
              2,
              (index) => TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Text(
                        'Test Product',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 14, right: 10),
                      child: QuantityInputWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Text(
                        '¥2',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Text(
                        '¥2',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: InkWell(
                        child: const Icon(Icons.delete_forever),
                        onTap: () {},
                      ),
                    )
                  ])).toList()
        ],
      ),
    );
  }
}
