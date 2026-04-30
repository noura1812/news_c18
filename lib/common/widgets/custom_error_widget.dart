import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c18/common/extensions/context_extensions.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage, required this.onRefresh});
  final String errorMessage;
  final void Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 15.h,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage, style: context.textTheme.bodyLarge),
          ElevatedButton.icon(
            onPressed: onRefresh,
            label: Text("Try again"),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
