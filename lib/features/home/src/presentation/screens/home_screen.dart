import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parthdarji_com/core/services/services.dart';
import 'package:parthdarji_com/features/home/home.dart';

import '../../../../../core/resources/src/colors.dart';
import '../../domain/entities/page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    homeBloc = getIt<HomeBloc>();
    homeBloc.add(GetAppsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.tertiarySystemBackground,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: homeBloc,
          builder: (context, state) {
            if (state is HomeLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        PageView(
                          onPageChanged: (index) {
                            setState(() {
                              _currentPageIndex = index;
                            });
                          },
                          children: List.generate(
                            state.pages.length,
                            (index) => Page(
                              details: state.pages[index],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20.0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 10.0,
                                width: index == _currentPageIndex ? 30.0 : 10.0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: index == _currentPageIndex
                                      ? Colors.blue
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80.0.h,
                    margin: EdgeInsets.only(
                      left: 8.0.w,
                      right: 8.0.w,
                      bottom: 16.0.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: CupertinoColors.systemGrey3,
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
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
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: CupertinoColors.systemGrey4, // Shadow color
                offset: Offset(1, 1), // Shadow position
                blurRadius: 10, // Shadow blur
                spreadRadius: 2, // Shadow spread
              ),
            ],
          ),
          child: SizedBox(
            height: 57.0.h,
            width: 57.0.h,
            child: SvgPicture.asset(
              details.imagePath,
              fit: BoxFit.contain, // Ensure the SVG fits its container
              alignment: Alignment.center, // Align it properly
            ),
          ),
        ),
        SizedBox(height: 5.0.h),
        Text(
          details.appName,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.black,
              ),
        ),
      ],
    );
  }
}
