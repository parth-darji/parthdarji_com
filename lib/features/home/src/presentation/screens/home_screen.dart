import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parthdarji_com/core/resources/src/assets.dart';
import 'package:parthdarji_com/core/services/services.dart';
import 'package:parthdarji_com/features/home/home.dart';

import '../../../../../core/resources/src/colors.dart';
import '../../domain/entities/page.dart';
import 'you_are_one_step_away_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = getIt<HomeBloc>();
    homeBloc.add(GetAppsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          if (state is HomeLoading) {
            return YouAreOneStepAwayScreen(
              homeBloc: homeBloc,
            );
          }

          return Scaffold(
            backgroundColor: CupertinoColors.tertiarySystemBackground,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    assets.images.iPhone15ProMaxNaturalTitaniumWallpaper,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: BlocBuilder<HomeBloc, HomeState>(
                  bloc: homeBloc,
                  builder: (context, state) {
                    if (state is HomeReadyToRender) {
                      return Column(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Expanded(
                                  child: PageView.builder(
                                    itemCount: state.pages.length,
                                    itemBuilder: (context, index) {
                                      return Page(
                                        details: state.pages[index],
                                      );
                                    },
                                    onPageChanged: (index) => homeBloc.add(
                                      ChangePageEvent(
                                        index,
                                        pages: state.pages,
                                      ),
                                    ),
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: Container(
                                    height: 27.0.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: CupertinoColors.black
                                          .withOpacity(0.4),
                                    ),
                                    padding: EdgeInsets.all(8.0.h),
                                    margin: EdgeInsets.only(
                                      left: 8.0.w,
                                      right: 8.0.w,
                                      bottom: 16.0.h,
                                    ),
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: List.generate(
                                        state.pages.length,
                                        (index) {
                                          return BlocBuilder<HomeBloc,
                                              HomeState>(
                                            bloc: homeBloc,
                                            buildWhen: (previousIndicatorState,
                                                currentIndicatorState) {
                                              if (previousIndicatorState
                                                      is HomeReadyToRender &&
                                                  currentIndicatorState
                                                      is HomeReadyToRender) {
                                                return previousIndicatorState
                                                        .pages[index]
                                                        .isSelected !=
                                                    currentIndicatorState
                                                        .pages[index]
                                                        .isSelected;
                                              }

                                              return false;
                                            },
                                            builder: (context, indicatorState) {
                                              bool isSelected = false;

                                              if (indicatorState
                                                  is HomeReadyToRender) {
                                                isSelected = indicatorState
                                                    .pages[index].isSelected;
                                              }

                                              return Container(
                                                height: 7.0.w,
                                                width: 7.0.w,
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 3.0.w,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: isSelected
                                                      ? CupertinoColors.white
                                                      : CupertinoColors
                                                          .systemGrey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 85.0.h,
                            margin: EdgeInsets.only(
                              left: 8.0.w,
                              right: 8.0.w,
                              bottom: 16.0.h,
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 17.0.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: CupertinoColors.black.withOpacity(0.4),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppIcon(
                                  details: App(
                                    imagePath: assets.svg.phone,
                                    appName: "",
                                    onTap: () {},
                                  ),
                                ),
                                AppIcon(
                                  details: App(
                                    imagePath: assets.svg.safari,
                                    appName: "",
                                    onTap: () {},
                                  ),
                                ),
                                AppIcon(
                                  details: App(
                                    imagePath: assets.svg.messages,
                                    appName: "",
                                    onTap: () {},
                                  ),
                                ),
                                AppIcon(
                                  details: App(
                                    imagePath: assets.svg.camera,
                                    appName: "",
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
          );
        });
  }
}

/// 24 apps per page
class Page extends StatelessWidget {
  final DrawerPage details;

  const Page({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        childAspectRatio: 9 / 11,
      ),
      padding: EdgeInsets.all(20.0.h),
      itemCount: details.apps.length,
      itemBuilder: (context, index) {
        return AppIcon(
          details: App(
            imagePath: details.apps[index].imagePath,
            appName: details.apps[index].appName,
            onTap: details.apps[index].onTap,
          ),
        );
      },
    );
  }
}

class AppIcon extends StatelessWidget {
  final App details;

  const AppIcon({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5.0.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            // boxShadow: const [
            //   BoxShadow(
            //     color: CupertinoColors.systemGrey4, // Shadow color
            //     offset: Offset(1, 1), // Shadow position
            //     blurRadius: 10, // Shadow blur
            //     spreadRadius: 2, // Shadow spread
            //   ),
            // ],
          ),
          child: SizedBox(
            height: 57.0.h,
            width: 57.0.h,
            child: SvgPicture.asset(
              details.imagePath,
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
            ),
          ),
        ),
        if (details.appName.isNotEmpty)
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.darkBackgroundGray,
                  offset: Offset(1, 1),
                  blurRadius: 50,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Text(
              details.appName,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ),
      ],
    );
  }
}
