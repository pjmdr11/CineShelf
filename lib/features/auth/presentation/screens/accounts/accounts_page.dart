import 'package:cine_shelf/core/utils/resource_helper.dart';
import 'package:cine_shelf/features/auth/presentation/screens/login_page/login_page.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = false;
    return isLoggedIn ? AccountDetailsPage() : LoginPageView();
  }
}

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ResourceHelper.getImagePath("splash_bg.png")),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }
}
