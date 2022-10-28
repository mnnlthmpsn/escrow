import 'package:escrow/generated/assets.dart';
import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:escrow/shared/app_deps/app_dimens.dart';
import 'package:escrow/shared/components/kAppBar.dart';
import 'package:escrow/shared/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/category_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kAppLayoutBackground,
      body: SafeArea(
        child: _body,
      ),
    );
  }

  Widget get _body {
    return Builder(builder: (BuildContext context) {
      return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0,
            backgroundColor: AppColors.kPrimaryColorWithOpacity,
            toolbarHeight: ScreenSize.getHeight(context) * .42,
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const KAppBar(
                  label: 'Welcome, Jojo',
                  textColor: AppColors.kPrimaryColor,
                  iconColor: AppColors.kPrimaryColor
                ),
                _welcomeNote
              ],
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppDimens.kSpacingLarge),
                  _openingNote,
                  const SizedBox(height: AppDimens.kSpacingLarge),
                  _categories
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  Widget get _welcomeNote {
    return Builder(builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * .3,
        width: double.infinity,
        child: SvgPicture.asset(Assets.svgBankDeal, fit: BoxFit.cover),
      );
    });
  }

  Widget get _openingNote {
    return Builder(builder: (BuildContext context) {
      return Text('Browse below all categories', style: Theme.of(context).textTheme.caption,);
    });
  }

  Widget get _categories {
    return Column(
      children: const [
        CategoryCard(icon: Icons.home_rounded, color: AppColors.kGreenColor, title: 'Category 1'),
        CategoryCard(icon: Icons.settings, title: 'Category 2'),
        CategoryCard(icon: Icons.bar_chart, color: AppColors.kSecondaryColor, title: 'Category 3'),
      ]
    );
  }
}
