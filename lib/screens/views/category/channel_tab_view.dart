import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/screens/widgets/news_card.dart';

class ChannelTabView extends StatelessWidget {
  const ChannelTabView({super.key, required this.channelCount});
  final int channelCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.r),
      itemBuilder: (context, index) => NewsCard(),
      itemCount: channelCount,
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
    );
  }
}
