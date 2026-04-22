import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/common/extensions/context_extensions.dart';
import 'package:news_c18/models/resource_model.dart';
import 'package:news_c18/network/network_services.dart';
import 'package:news_c18/screens/provider/main_screen_provider.dart';
import 'package:news_c18/screens/views/category/channel_tab_view.dart';
import 'package:provider/provider.dart';

class CatDetailsView extends StatelessWidget {
  CatDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResourceModel?>(
      future: NetworkServices.getResources(
        Provider.of<MainScreenProvider>(context).selectedCategory!.name,
      ),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasError) {
          return Center(child: Text(asyncSnapshot.error.toString()));
        }
        ResourceModel? resourceModel = asyncSnapshot.data;
        if (resourceModel == null ||
            resourceModel.sources == null ||
            resourceModel.sources!.isEmpty) {
          return Center(child: Text('something went wrong \ntry again later'));
        }
        List<Sources> sources = resourceModel.sources!;
        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                padding: EdgeInsetsDirectional.only(start: 15.w),
                labelStyle: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                unselectedLabelColor: context.theme.highlightColor,
                unselectedLabelStyle: context.textTheme.titleMedium,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: context.theme.highlightColor,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: sources
                    .where((element) => element.id != null)
                    .map((source) => Tab(text: source.name.toString()))
                    .toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: sources
                      .where((element) => element.id != null)
                      .map((source) => ResourceTabView(resourceId: source.id!))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
