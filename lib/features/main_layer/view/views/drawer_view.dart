import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/common/extensions/context_extensions.dart';
import 'package:news_c18/common/gen/assets.gen.dart';
import 'package:news_c18/features/main_layer/view_model/cubit/cubit/main_layer_cubit.dart';
import 'package:news_c18/features/main_layer/view_model/provider/main_screen_provider.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: ListView(
        children: [
          ColoredBox(
            color: context.theme.highlightColor,
            child: SizedBox(height: 166.h, width: double.infinity),
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                _drawListTile(
                  context: context,
                  leadingIcon: Assets.icons.home.svg(),
                  title: "Go To Home",
                  onTap: () {
                    BlocProvider.of<MainLayerCubit>(
                      context,
                      listen: false,
                    ).removeSelectedCategory();
                    Navigator.of(context).pop();
                  },
                ),
                Divider(),
                _drawListTile(
                  context: context,
                  leadingIcon: Assets.icons.theme.svg(),
                  title: "Theme",
                  onTap: () {},
                ),
                DropdownButtonFormField<ThemeMode>(
                  // value: ThemeMode.light,
                  decoration: InputDecoration(
                    border: _drawBorder(context: context),
                    errorBorder: _drawBorder(context: context),
                    enabledBorder: _drawBorder(context: context),
                    focusedBorder: _drawBorder(context: context),
                    disabledBorder: _drawBorder(context: context),
                    focusedErrorBorder: _drawBorder(context: context),
                  ),
                  dropdownColor: context.theme.primaryColor,

                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.dark,

                      child: Text(
                        "Dark theme", //TODO:localization
                        style: context.textTheme.displayMedium!.copyWith(
                          color: context.theme.highlightColor,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text(
                        "Light theme",
                        style: context.textTheme.displayMedium!.copyWith(
                          color: context.theme.highlightColor,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                Divider(),
                _drawListTile(
                  context: context,
                  leadingIcon: Assets.icons.lang.svg(),
                  title: "Language",
                  onTap: () {},
                ),
                DropdownButtonFormField<String>(
                  // value:'ar',
                  decoration: InputDecoration(
                    border: _drawBorder(context: context),
                    errorBorder: _drawBorder(context: context),
                    enabledBorder: _drawBorder(context: context),
                    focusedBorder: _drawBorder(context: context),
                    disabledBorder: _drawBorder(context: context),
                    focusedErrorBorder: _drawBorder(context: context),
                  ),
                  dropdownColor: context.theme.primaryColor,

                  items: [
                    DropdownMenuItem(
                      value: 'ar',

                      child: Text(
                        "Arabic", //TODO:localization
                        style: context.textTheme.displayMedium!.copyWith(
                          color: context.theme.highlightColor,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(
                        "English",
                        style: context.textTheme.displayMedium!.copyWith(
                          color: context.theme.highlightColor,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _drawBorder({required BuildContext context}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: context.theme.highlightColor),
      borderRadius: BorderRadius.circular(16),
    );
  }

  ListTile _drawListTile({
    required BuildContext context,
    required String title,
    required Widget leadingIcon,
    void Function()? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: leadingIcon,
      title: Text(
        title,
        style: context.textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
