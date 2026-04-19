import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/common/extensions/context_extensions.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.highlightColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(
              "https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg",
              height: 220.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            "40-year-old man falls 200 feet to his death while canyoneering at national park",
            style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "By : Jon Haworth",
                style: context.textTheme.bodyMedium!.copyWith(color: Color(0xffA0A0A0)),
              ),
              Text(
                "15 minutes ago",
                style: context.textTheme.bodyMedium!.copyWith(color: Color(0xffA0A0A0)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
