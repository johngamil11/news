import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/utils/color_manager.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  Function onSideFunctionClick;
  HomeDrawer({required this.onSideFunctionClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 30.h),
          width: double.infinity,
          color: ColorManager.primary,
          child: Text(
            'News App!',
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              onSideFunctionClick(categories);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 24,
                        color: ColorManager.darkGrey,
                      ),
                )
              ],
            ),
          ),
        ),
       
      ],
    );
  }
}
