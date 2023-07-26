import 'package:flutter/material.dart';
import '../../widgets/widgets.dart' as global;

import '../../../configs/themes/themes.dart';
import 'widgets/widgets.dart';

class AddMultiProductPage extends StatelessWidget {
  const AddMultiProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            AddMultiProductAppBarWidget(),
            SliverToBoxAdapter(
              child: DropDownWidget(),
            ),
            SliverToBoxAdapter(
              child: ProductListWidget(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 40, top: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Total ¥4',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: global.ElevatedButtonWidget(
                      borderSide: Theme.of(context).primaryColor,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      backgroundColor: Colors.white,
                      borderWidth: 1,
                      elevation: 0,
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 16, color: ThemeConfig.primaryColor),
                      ),
                    ),
                  ),
                  Expanded(
                    child: global.ElevatedButtonWidget(
                      borderSide: Theme.of(context).primaryColor,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      backgroundColor: Colors.white,
                      borderWidth: 1,
                      elevation: 0,
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Save',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 16, color: ThemeConfig.primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
