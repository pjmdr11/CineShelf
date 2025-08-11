import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/core/extensions/string_utils.dart';
import 'package:cine_shelf/features/app/presentation/provider/app_state_provider.dart';
import 'package:cine_shelf/features/app/presentation/screens/dashboard_page_view/components/app_bar.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "pages.settings".tr()),
      body: Builder(
        builder: (context) {
          return ListView(
            children: [
              ProfileInfoWidget(),
              Divider(color: Colors.grey.withAlpha(70)),
              ThemeSelectionWidget(),
              VerticalSpacer(),
              LanguageSelection(),
            ],
          );
        },
      ),
    );
  }
}

class LanguageSelection extends ConsumerWidget {
  const LanguageSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        "general.text_language_selection".tr(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16.rf(),
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "general.text_language_selection_subtitle".tr(),
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(fontSize: 12.rf()),
      ),
      trailing: DropdownButton<String>(
        isDense: true,
        dropdownColor: Theme.of(context).canvasColor,
        underline: Container(),
        value: context.locale.languageCode,
        items: supportedLanguages.entries.map((entry) {
          return DropdownMenuItem<String>(
            value: entry.key,
            child: Text(
              entry.value["label"].toString().tr(),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 14.rf()),
            ),
          );
        }).toList(),
        onChanged: (newLanguage) {
          if (newLanguage != null) {
            final locale = supportedLanguages[newLanguage]?["locale"];
            final primary = locale.toString().split('_').first;
            final secondary = locale.toString().split('_').last;
            context.setLocale(Locale(primary, secondary));
          }
        },
      ),
    );
  }
}

class ThemeSelectionWidget extends ConsumerWidget {
  const ThemeSelectionWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appStateNotifierProvider).appTheme;
    return ListTile(
      title: Text(
        "general.text_theme_selection".tr(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16.rf(),
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "general.text_theme_selection_subtitle".tr(),
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(fontSize: 12.rf()),
      ),
      trailing: DropdownButton<ThemeMode>(
        isDense: true,
        dropdownColor: Theme.of(context).canvasColor,
        underline: Container(),
        value: ThemeMode.values.firstWhere((mode) => mode.name == themeMode),
        items: ThemeMode.values.map((mode) {
          return DropdownMenuItem(
            value: mode,
            child: Text(
              mode.name.tr().capitalizeFirstLetter(),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 14.rf()),
            ),
          );
        }).toList(),
        onChanged: (newMode) {
          if (newMode != null) {
            ref
                .read(appStateNotifierProvider.notifier)
                .changeTheme(newMode.name);
          }
        },
      ),
    );
  }
}

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    //TODO Implement Profile details widget.
    return Container();
  }
}
