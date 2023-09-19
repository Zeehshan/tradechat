import 'package:flutter/material.dart';
import 'package:tradechat/ui/widgets/widgets.dart';

import '../../../utils/utils.dart';
import 'widgets/widgets.dart';

class CreareOrderProductPage extends StatelessWidget {
  const CreareOrderProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundColor: const Color(0xffededed),
        backButtonCallback: () => Navigator.pop(context),
        centerTitle: true,
        title: Text(
          'Create Product and add to order',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ImageWidget(),
          ),
          const SliverToBoxAdapter(
            child: TitleInputWidget(),
          ),
          const SliverToBoxAdapter(
            child: LinkInputWidget(),
          ),
          const SliverToBoxAdapter(
            child: QuantityInputWidget(),
          ),
          const SliverToBoxAdapter(
            child: PriceInputWidget(),
          ),
          const SliverToBoxAdapter(
            child: DescriptionInputWidget(),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButtonWidget(
                      child: Text(
                        'Save',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                      onPressed: () {}),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButtonWidget(
                      backgroundColor: Colors.transparent,
                      borderSide: Theme.of(context).primaryColor,
                      child: Text(
                        'Save',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14),
                      ),
                      onPressed: () {}),
                  SizedBox(height: CustomSizeHelper.bottomHeight(context)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
