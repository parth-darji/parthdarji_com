part of splash;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then((value) {
      Navigation.push(
        context,
        // namedNavigation: NamedNavigationModel(
        //   routeName: Routes.hello,
        // ),
        widgetNavigation: WidgetNavigationModel(
          screenWidget: const HelloScreen(),
          customPageRoute: PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 700),
            pageBuilder: (_, __, ___) => const HelloScreen(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 110.0.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    Images.appLogo,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60.0.h,
              child: Lottie.asset(
                Animations.waitingSandBlue,
                height: 70.0.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
