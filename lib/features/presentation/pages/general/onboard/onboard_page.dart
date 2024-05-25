import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  late PageController _pageController;

  int _pageIndex = 0;
  bool _isLastPage = false;

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex = value;
                    if (value == 2) {
                      _isLastPage = true;
                    } else {
                      _isLastPage = false;
                    }
                  });
                },
                children: [
                  OnboardContent(
                    images: Images.icLogo,
                    text: Strings.of(context)!.professionalService,
                  ),
                  OnboardContent(
                    images: Images.icLauncher,
                    text: Strings.of(context)!.yourSatisfaction,
                  ),
                  OnboardContent(
                    images: Images.icLogo,
                    text: Strings.of(context)!.letsRepair,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimens.space16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimens.space4),
                    child: PageIndicator(isActive: index == _pageIndex),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.space24,
                vertical: Dimens.space46,
              ),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.all(Dimens.space16),
                  minimumSize: Size.fromHeight(Dimens.space36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.circular50),
                  ),
                ),
                onPressed: () {
                  if (_isLastPage) {
                    context.push(Routes.login.path);
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  }
                },
                child: _isLastPage
                    ? Text(Strings.of(context)!.start)
                    : Text(Strings.of(context)!.next),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
