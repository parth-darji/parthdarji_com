part of onboarding;

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 3000,
      ),
    );
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final languageList = LanguageData.languageList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.0.h),
            Center(
              child: Icon(
                CupertinoIcons.globe,
                size: 80.0.h,
              ),
            ),
            SizedBox(height: 40.0.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                itemCount: languageList.length,
                itemBuilder: (context, index) {
                  bool firstIndex = index == 0;
                  bool lastIndex = index == languageList.length - 1;

                  return Splash(
                    firstIndex: firstIndex,
                    lastIndex: lastIndex,
                    onPressed: () {
                      Traveller.go(
                        context,
                        namedTravelling: NamedTravelling(
                          destinationName: Routes.login,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.0.w,
                        vertical: 15.0.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            languageList[index].name,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Icon(
                            CupertinoIcons.forward,
                            color: AppColors.lightGray2,
                            size: 17.0.h,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
