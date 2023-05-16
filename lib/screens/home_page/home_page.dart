import 'package:electro_bikes/cubits/features/feature_cubit.dart';
import 'package:electro_bikes/cubits/features/feature_states.dart';
import 'package:electro_bikes/cubits/range_selector/range_selector_cubit.dart';
import 'package:electro_bikes/cubits/range_selector/range_state.dart';
import 'package:electro_bikes/screens/home_page/widgets/homepage_features.dart';
import 'package:electro_bikes/screens/home_page/widgets/homepage_gradient_container.dart';
import 'package:electro_bikes/screens/home_page/widgets/homepage_range_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/common_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 10),
        child: Column(
          children: [
            CommonAppBar(),
            SizedBox(
              height: 20,
            ),
            HomePageGradientContainer(),
            BlocBuilder<RangeSelectorCubit, RangeState>(
              builder: (context, state) {
                return HomePageRangeSection(
                  state: state,
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<FeatureCubit, FeatureState>(
              builder: (context, state) {
                return HomePageFeatures(
                  state: state,
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
