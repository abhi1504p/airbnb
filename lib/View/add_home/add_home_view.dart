import 'package:airbnb/View/card/add_card_view.dart';
import 'package:airbnb/core/widgets/app_button.dart';
import 'package:airbnb/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHomeView extends StatelessWidget {
  const AddHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Row(
         mainAxisAlignment: MainAxisAlignment.center,
           children: [
             AppButton(type: ButtonType.filled,text: "Cancel",onPressed: ()=>Get.back(),),
             SizedBox(width: 30,),
             AppButton(type: ButtonType.filled,text: "Add", onPressed: ()=> Get.toNamed(AppRoutes.addCard),),

           ],
         )
        ],
      ),
    );
  }
}
