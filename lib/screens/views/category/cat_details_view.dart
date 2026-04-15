import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/common/extensions/context_extensions.dart';
import 'package:news_c18/screens/views/category/channel_tab_view.dart';

class CatDetailsView extends StatelessWidget {
  CatDetailsView({super.key});
  List<int> channels = [1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: channels.length,
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
            tabs: channels.map((e) => Tab(text: 'channel' + e.toString())).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: channels.map((e) => ChannelTabView(channelCount: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
