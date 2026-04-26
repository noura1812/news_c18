import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/common/extensions/context_extensions.dart';
import 'package:news_c18/models/artecle_response_model.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:cached_network_image/cached_network_image.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.articles});
  final Articles articles;
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
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage!,
              height: 220.h,
              width: double.infinity,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => SizedBox(
                height: 220.h,
                child: Center(
                  child: Icon(Icons.broken_image, color: context.theme.highlightColor, size: 50.r),
                ),
              ),
              placeholder: (context, url) => SizedBox(
                height: 220.h,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          Text(
            articles.title ?? "",
            style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "By : ${articles.author ?? '-'}",
                  style: context.textTheme.bodyMedium!.copyWith(color: Color(0xffA0A0A0)),
                ),
              ),
              if (articles.publishDate != null)
                Text(
                  timeAgo.format(articles.publishDate!),
                  style: context.textTheme.bodyMedium!.copyWith(color: Color(0xffA0A0A0)),
                ),
            ],
          ),
        ],
      ),
    );
  }

  format() {}
}
