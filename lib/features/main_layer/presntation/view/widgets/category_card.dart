import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/common/enums/category_enum.dart';
import 'package:news_c18/features/main_layer/presntation/view_model/cubit/cubit/main_layer_cubit.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryEnum category;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MainLayerCubit cubit = BlocProvider.of<MainLayerCubit>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      margin: EdgeInsets.only(bottom: 10.h),
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: theme.highlightColor,
        image: DecorationImage(image: AssetImage(category.getImage()), fit: BoxFit.fill),
      ),
      alignment: category.index % 2 == 0 ? Alignment(.6, .5) : Alignment(-.6, .5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category.name,
            style: theme.textTheme.displayLarge!.copyWith(color: theme.primaryColor),
          ),
          InkWell(
            onTap: () {
              cubit.selectCategory(category);
              // BlocProvider.of<ResourcesCubit>(context, listen: false).getResources(category.name);
              cubit.getResources();
            },
            child: Container(
              height: 54.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(84.r),
                color: theme.primaryColor.withValues(alpha: .5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: category.index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "View All",
                      style: theme.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  CircleAvatar(
                    radius: 27.r,
                    backgroundColor: theme.primaryColor,
                    child: Icon(
                      category.index % 2 == 0 ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                      color: theme.highlightColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
