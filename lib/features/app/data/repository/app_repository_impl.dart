import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/constants/pref_constants.dart';
import 'package:cine_shelf/data/local/preference_helper.dart';
import 'package:cine_shelf/features/app/domain/respository/app_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  final PreferenceHelper preferenceHelper;

  AppRepositoryImpl({required this.preferenceHelper});

  @override
  void changeTheme(String theme) {
    preferenceHelper.setString(prefTheme, theme);
  }

  @override
  String getAppTheme() {
    return preferenceHelper.getString(prefTheme, def: appThemeSystem);
  }

  @override
  bool isFirstOpen() {
    return preferenceHelper.getBool(prefFirstOpen, def: false);
  }
}
