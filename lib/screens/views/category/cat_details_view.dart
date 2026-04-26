import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/common/extensions/context_extensions.dart';
import 'package:news_c18/models/resource_model.dart';
import 'package:news_c18/screens/cubit/cubit/main_layer_cubit.dart';
import 'package:news_c18/screens/cubit/resources/resources_cubit.dart';
import 'package:news_c18/screens/cubit/resources/resources_cubit_state.dart';
import 'package:news_c18/screens/views/category/channel_tab_view.dart';

class CatDetailsView extends StatelessWidget {
  const CatDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayerCubit, MainLayerState>(
      builder: (context, state) {
        if (state.resourcesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.resourcesErrorMessage != null) {
          return Center(child: Text(state.resourcesErrorMessage!));
        } else if (state.resourceModel != null) {
          ResourceModel resourceModel = state.resourceModel!;

          List<Sources>? sources = resourceModel.sources ?? [];
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
        } else
          return SizedBox();
      },
    );

    // return FutureBuilder<ResourceModel?>(
    //   future: NetworkServices.getResources(
    //     Provider.of<MainScreenProvider>(context).selectedCategory!.name,
    //   ),
    //   builder: (context, asyncSnapshot) {
    //     if (asyncSnapshot.connectionState == ConnectionState.waiting) {
    //
    //     } else if (asyncSnapshot.hasError) {
    //       }
    //     ResourceModel? resourceModel = asyncSnapshot.data;
    //     if (resourceModel == null ||
    //         resourceModel.sources == null ||
    //         resourceModel.sources!.isEmpty) {
    //       return Center(child: Text('something went wrong \ntry again later'));
    //     }
    //    },
    // );
  }
}
