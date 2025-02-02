import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/color_manager.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticaleView extends StatelessWidget {
  final String imageUrl;
  final String auther;
  final String title;
  final String publishedAt;

  ArticaleView({
    required this.imageUrl,
    required this.auther,
    required this.title,
    required this.publishedAt,
  });

  String getTimeAgo() {
    try {
      DateTime parsedDate = DateTime.parse(publishedAt); 
      return timeago.format(parsedDate, locale: 'en'); 
    } catch (e) {
      return publishedAt; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(auther),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(getTimeAgo()),
          ),
        ],
      ),
    );
  }
}
