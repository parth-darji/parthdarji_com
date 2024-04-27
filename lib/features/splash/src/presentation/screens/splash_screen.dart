part of splash;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          Images.seaBreezeWallpaper,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 35.0,
                        sigmaY: 35.0,
                      ),
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      ),
                    ),
                  ),
                  Lottie.asset(
                    Animations.helloIphone,
                    height: 300,
                    filterQuality: FilterQuality.high,
                  ),
                ],
              ),
            ),
            Text(Languages.of(context).swipeUpToOpen),
          ],
        ),
      ),
    );
  }
}
