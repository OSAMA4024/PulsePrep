import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomDialogueBox extends StatelessWidget {
  const CustomDialogueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 360,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(40),

      ),
      child: Column(
        children: [
          SizedBox(height: 3,),
          SizedBox(height: 30,),
          ClipOval(
            child: Image.asset(
              "assets/images/person2.png",
              width: 150,   // 2 * radius
              height: 150,  // 2 * radius
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30,),
Text('Congratulation', style: GoogleFonts.jost(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xff202244)),),
          SizedBox(height: 20,),
          Text('Your Account is Ready to Use. You will be \nredirected to the Home Page in a Few \nSeconds.',
            style: GoogleFonts.mulish(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff434343),


            ),
          textAlign: TextAlign.center,
          )


        ],
      ),
    );
  }
}
