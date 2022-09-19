
import 'package:beting_app/sceens/login_signup/login_signup/login_screen.dart';
import 'package:beting_app/sceens/login_signup/uplod_scrrensort.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Helper/style.dart';

import '../rechargepage.dart';
import '../withdrawscreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "playerZone",
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
          backgroundColor: Style.backgroundColor,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(FontAwesomeIcons.bell))
          ]),
      backgroundColor: Style.backgroundColor3,
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.05, top: height * 0.02),
        child: Column(
          children: [
            Container(
              height: height * 0.4,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: height * 0.06,
                      child: CircleAvatar(
                          radius: height * 0.05,
                          child: Icon(
                            Icons.person,
                            size: height * 0.05,
                          )),
                    ),
                  ),
                  Text(
                    "Name: Tanvir",
                    style: GoogleFonts.actor(color: Colors.black87),
                  ),
                  Text(
                    "Emai: Tanvir@gmail.com",
                    style: GoogleFonts.actor(color: Colors.black87),
                  ),
                  Text(
                    "UID or refarel id: fhfwh8fof84",
                    style: GoogleFonts.actor(color: Colors.black87),
                  ),
                  Row(
                    children: [
                       SizedBox(width: width * 0.03),
                      SizedBox(
                        width: width*0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
                          ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                        RechargeScreen()));
                            },
                            child:  Text("Recarge",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.bold),)),
                      ),
                      SizedBox(width: width * 0.03),
                      SizedBox(
                        width: width*0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
                          ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WithDrawRequest()));
                            },
                            child: const Text("withdraw")),
                      ),
                     
                    ],
                  ),
                  Row(
                    children: [
                       SizedBox(width: width * 0.03),
                      SizedBox(  width: width*0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
                          ),
                            onPressed: () {}, child: const Text("Reffer&ern")),
                      ),
                      SizedBox(width: width * 0.03),
                      SizedBox(
                          width: width*0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
                          ),
                        onPressed: () {}, child: const Text("History")))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: () {
                           Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const UpoldScreenSort()));
                        },
                        child:
                       Text("Uplod your wining Screen sort ang get Pyment",style: GoogleFonts.lato(fontSize: 12),)),
                  )
                ],
              ),
            ),
           SizedBox(height: height*0.3,),
             SizedBox(
              height: height*0.05,
              width: width*0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange
                ),
                onPressed: (){
                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginScreen()));
                }, child: const Text("log out")),
            )
          ],
        ),
      ),
    );
  }
}