import 'package:cine_shelf/features/app/presentation/screens/dashboard_page_view/components/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "bottom_nav.favourites".tr()),
      body: Builder(
        builder: (context) {
          //Todo add favourites results
          return Container();
        },
      ),
    );
  }
}
