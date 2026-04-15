import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/common/enums/category_enum.dart';
import 'package:news_c18/screens/widgets/category_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ListView(
      padding: EdgeInsets.all(15.r),

      children: [
        Text(
          "Good Morning \nHere is Some News For You",
          style: theme.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10.h),
        ...CategoryEnum.values.map((e) => CategoryCard(category: e)),
      ],
    );
  }
}
