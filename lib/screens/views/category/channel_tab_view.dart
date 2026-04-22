import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/models/artecle_response_model.dart';
import 'package:news_c18/network/network_services.dart';
import 'package:news_c18/screens/widgets/news_card.dart';

class ResourceTabView extends StatelessWidget {
  const ResourceTabView({super.key, required this.resourceId});
  final String resourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticleResponseModel?>(
      future: NetworkServices.getArticles(resourceId),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasError) {
          return Center(child: Text(asyncSnapshot.error.toString()));
        }
        ArticleResponseModel? articleResponseModel = asyncSnapshot.data;
        if (articleResponseModel == null || articleResponseModel.articles!.isEmpty) {
          return Center(child: Text("something went wrong try again later"));
        }
        List<Articles> articles = articleResponseModel.articles!;
        return ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemBuilder: (context, index) => NewsCard(articles: articles[index]),
          itemCount: articles.length,
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
        );
      },
    );
  }
}
