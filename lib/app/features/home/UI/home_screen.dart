import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_theme.dart';
import '../../../core/navigation/UI/navigation_panel.dart';
import '../../../core/navigation/logic/navigation_cubit.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/drawer/custom_drawer.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBar(
              title: CustomText(
                text: titleSelect(state),
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              elevation: 0,
              centerTitle: true,
              backgroundColor: Color(0xffFCF7F5),
              shape: RoundedRectangleBorder(),
            ),
          ),
          drawer: CustomDrawer(),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(child: SingleChildScrollView(child: body(state))),
                NavigationPanel(),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget body(NavigationState state) {
  switch (state) {
    case NavigationState.home:
      return HomeBody();
    case NavigationState.settings:
      return Center(child: Text('Settings Content'));
    case NavigationState.profile:
      return CustomText(text: 'lkjla;fj');
    case NavigationState.questions:
      return CustomText(text: 'lkjla;fj');
    case NavigationState.favourites:
      return CustomText(text: 'lkjla;fj');
  }
}

String titleSelect(NavigationState state) {
  switch (state) {
    case NavigationState.home:
      return 'الرئيسية';
    case NavigationState.settings:
      return 'الاعدادات';
    case NavigationState.profile:
      return 'الملف الشخصي ';
    case NavigationState.questions:
      return 'الأسئلة';
    case NavigationState.favourites:
      return 'المفضلة';
  }
}
