import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/common/widgets/custom_error_widget.dart';
import 'package:news_c18/features/main_layer/domain/entities/articles_entity.dart';
import 'package:news_c18/features/main_layer/presntation/view_model/cubit/cubit/main_layer_cubit.dart';
import 'package:news_c18/features/main_layer/presntation/view/widgets/news_card.dart';

class ResourceTabView extends StatefulWidget {
  const ResourceTabView({super.key, required this.resourceId});
  final String resourceId;

  @override
  State<ResourceTabView> createState() => _ResourceTabViewState();
}

class _ResourceTabViewState extends State<ResourceTabView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<MainLayerCubit>(context, listen: false).getArticles(widget.resourceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayerCubit, MainLayerState>(
      builder: (context, state) {
        // switch (state) {
        //   case ArticlesInitialCubitState():
        //   case ArticlesLoadingState():
        //     return Center(child: CircularProgressIndicator());

        //   case ArticlesFailureState():
        //     return Center(child: Text(state.errorMessage));
        //   case ArticlesSuccessState():
        //     ArticleResponseModel articleResponseModel = state.articleResponseModel;

        //     List<Articles> articles = articleResponseModel.articles ?? [];
        //     return ListView.separated(
        //       padding: EdgeInsets.all(16.r),
        //       itemBuilder: (context, index) => NewsCard(articles: articles[index]),
        //       itemCount: articles.length,
        //       separatorBuilder: (context, index) => SizedBox(height: 10.h),
        //     );
        // }

        if (state.articlesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.articlesErrorMessage != null) {
          return CustomErrorWidget(
            errorMessage: state.articlesErrorMessage!,
            onRefresh: () {
              BlocProvider.of<MainLayerCubit>(
                context,
                listen: false,
              ).getArticles(widget.resourceId);
            },
          );
          //Center(child: Text(state.articlesErrorMessage!));
        } else if (state.articles != null) {
          List<ArticlesEntity> articles = state.articles!;

          return ListView.separated(
            padding: EdgeInsets.all(16.r),
            itemBuilder: (context, index) => NewsCard(articles: articles[index]),
            itemCount: articles.length,
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
