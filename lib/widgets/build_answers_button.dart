import 'package:flutter/material.dart';

import '../utilies/app_colors.dart';

class buildKeyButton extends StatelessWidget {
  buildKeyButton({
    super.key,
    required this.text1,
    required this.answers,
    required this.onTap,
    required this.onSellected
  });

  String text1;
  String answers;
  Function onTap;
  bool onSellected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.mainTextColor.withOpacity(0.25),
              spreadRadius: 4,
              blurRadius: 13,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: MaterialButton(
          color:  onSellected ? Colors.green :Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          splashColor: Colors.blue,
          onPressed: () {
            onTap();
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(17),
                child: Text(
                  text1,
                  style: const TextStyle(
                    color: AppColors.mainTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 47,
                    left: 2,
                  ),
                  child: Text(
                    answers,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
