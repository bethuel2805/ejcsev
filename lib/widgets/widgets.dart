import 'package:flutter/material.dart';

Widget ButtonLogin({required BuildContext context,required String text,required String imagePath,required Function onPress}){
  return InkWell(
    onTap: (){
      onPress();
    },
    child: SizedBox(height: 40,
      width: MediaQuery.of(context).size.width/1.2,
      child: Container(
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("$imagePath",width: 25,),
            Text("$text",style: TextStyle(
              fontSize: 16,
            ),),
            const SizedBox(width: 10,),
          ],
        ),
      ),
    ),
  );
}