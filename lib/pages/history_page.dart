import 'package:flutter/material.dart';
import 'package:quiz/repository/hive_repository.dart';
import 'package:quiz/utilies/app_png.dart';

import '../utilies/app_colors.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HiveRepository hiveRepository = HiveRepository();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        title: Text(
          "History",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppPng.bcgSplash,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          PageView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              for (int i = 0; i < hiveRepository.getTestName().length; i++)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.width-50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              hiveRepository.getTestName()[i],
                              style: const TextStyle(
                                color: AppColors.mainTextColor,
                                fontSize: 33,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              hiveRepository.getScore()[i],
                              style: const TextStyle(
                                color: AppColors.mainTextColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            (int.parse(hiveRepository
                                    .getScore()[i]
                                    .substring(0, 1))) <=
                                3 ?
                              const Text(
                                'Your result is worse, you should learn basic knowledges and you can use this quiz to test your skills ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              ) : const Text(
                              'Your result is good, you learnt basic knowladges sucsessfully , please keep going! ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.green, fontSize: 20),
                            ),



                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(hiveRepository.getCurrentTime()[i]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // ListView.builder(
          //   physics: const BouncingScrollPhysics(),
          //   itemCount:hiveRepository.getTime().length,
          //   itemBuilder: (buildContext, int index) {
          //     return Padding(
          //       padding: const EdgeInsets.only(
          //         right: 15,
          //         left: 15,
          //         top: 15,
          //       ),
          //       child: Container(
          //         height: 50,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(15),
          //           color: Colors.white,
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.all(10.0),
          //           child: Row(
          //             children: [
          //               Expanded(
          //                 flex: 2,
          //                 child: Text(
          //                   hiveRepository.getTestName()[index],
          //                   style:const TextStyle(
          //                     color: AppColors.mainTextColor,
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //               ),
          //               Expanded(
          //                 flex: 2,
          //                 child: Text(
          //                           hiveRepository.getScore()[index],
          //                   style:const TextStyle(
          //                     color: AppColors.mainTextColor,
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //               ),
          //               Expanded(
          //                 child: Text(
          //                    hiveRepository.getTime()[index],
          //                   style:const TextStyle(
          //                     color: AppColors.mainTextColor,
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
