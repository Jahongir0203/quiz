import 'package:flutter/material.dart';

import '../utilies/app_colors.dart';

class buildMainCotainer extends StatelessWidget {
  buildMainCotainer({
    super.key,
    required this.text,
    required this.onTap,

  });

  late final String text;
  late final Function onTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 46,
        right: 46,
        top: 36,
      ),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 95,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:AppColors.mainTextColor.withOpacity(0.2),
                blurRadius: 20,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
