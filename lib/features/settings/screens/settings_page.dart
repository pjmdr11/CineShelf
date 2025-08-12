import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/di/injection.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/core/extensions/string_utils.dart';
import 'package:cine_shelf/features/app/presentation/cubit/app_cubit.dart';
import 'package:cine_shelf/features/app/presentation/screens/dashboard_page_view/components/app_bar.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key});

  @override
  Widget build(BuildContext context) {
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
              entry.value,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 14.rf()),
            ),
          );
        }).toList(),
        onChanged: (newLanguage) {
          if (newLanguage != null) {
            context.setLocale(Locale(newLanguage));
          }
        },
      ),
    );
  }
}

class ThemeSelectionWidget extends StatelessWidget {
  const ThemeSelectionWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final themeMode = getIt<AppCubit>().getCurrentTheme();
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
            value: ThemeMode.values.firstWhere(
              (mode) => mode.name == themeMode,
            ),
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
                getIt<AppCubit>().changeTheme(newMode.name);
              }
            },
          ),
        );
      },
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
