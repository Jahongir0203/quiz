import 'package:flutter/material.dart';
import 'package:quiz/utilies/app_colors.dart';
import 'package:quiz/utilies/app_png.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        title: Text(
          "About",
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppPng.bcgSplash,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
         const Padding(
            padding:  EdgeInsets.all(10.0),
            child:Text('''  This application is made by Jahongir Eshonqulov in 27/10/2023.In this application you can test your basic knowledges about subjects with a wonderful music and UI.Firstly, you choose subject which do you want to test your knowledge, if you start quiz timer starts.After you completed quiz in Result page you can see you result.And all of your history saved in history page with feedback,whatever please don not give up, please keep going.
      
            ''',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500,),),
          ),
        ],
      ),
    );
  }
}
