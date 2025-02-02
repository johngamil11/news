import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/utils/my_theme_data.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:news/core/utils/color_manager.dart';

class ArticalesDetails extends StatelessWidget {
  String titleId ; 
  String imageUrl ; 
  String author ; 
  String title ;
  String time ;
  String content ;
  String description ;
  String link ;
   ArticalesDetails({
    required this.titleId, required this.imageUrl,
    required this.author , required this.time , required this.title,
    required this.content , required this.description, required this.link
  }) ;

  String getTimeAgo() {
    try {
      DateTime parsedDate = DateTime.parse(time); 
      return timeago.format(parsedDate, locale: 'en'); 
    } catch (e) {
      return time; 
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
           color: ColorManager.white,
          child: Image.asset(
              'assets/images/background.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
        ),
         Scaffold(
          backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          title: Text(titleId),
          titleTextStyle: TextStyle(color: ColorManager.white, fontSize: 35),
          centerTitle: true,
          toolbarHeight: 70.h,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
          
        ),
        body: 
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(7),
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                height: 250.h,
                decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                ),
                child:   CachedNetworkImage(
                  imageUrl: imageUrl , fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(color: ColorManager.primary,),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                //Image.network(imageUrl) 
              ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
               child: Align(
               alignment: AlignmentDirectional.topStart,
                child: Text(author ,style: TextStyle(color: ColorManager.darkGrey),),
                         ),
             ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(getTimeAgo()),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                height: 400.h,
                width: 370.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorManager.white
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(description ,style:  Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith( color:ColorManager.articale,fontSize: 16 , fontWeight: FontWeight.bold ),),
                    ),
                    SizedBox(height: 5.h,),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(content,style:  Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith( color:ColorManager.articale,fontSize: 16 , fontWeight: FontWeight.bold )),
                      ),
                    ),
                 
                  ],
                ),
                
              ),
            )
          
            
            ],
          ),
        ),
       
        
      
          ),
    ]);
  }
}
