import 'package:beting_app/Helper/fbase.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Helper/style.dart';
import '../models/gamemodel.dart';
import '../widget/beting_card.dart';

class CricketFootballScreen extends StatelessWidget {
      CricketFootballScreen({super.key});
  final FireBase fireBase = FireBase();
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: width * 0.35,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.green,
                          shape: const StadiumBorder()),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "600",
                            style: GoogleFonts.lato(color: Colors.black),
                          ),
                          const Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.black,
                            size: 8,
                          )
                        ],
                      )),
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(FontAwesomeIcons.bell))
            ]),
        backgroundColor: Style.backgroundColor,
        body: 
       Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: StreamBuilder<List<GameModel>>(
                            stream: fireBase.allgames(),
                            builder: (context, snap) {
                              return snap.hasData?ListView.builder(
                                  itemCount: snap.data!.length,
                                  itemBuilder: (context, index) {
                                    GameModel game = snap.data![index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
      height: height * 0.14,
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xffEBFCED),
          borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Text("Bangladesh vs Pakistan",style: GoogleFonts.alike(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
                ),),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
               Padding(
                 padding:  EdgeInsets.only(left: width*0.04),
                 child: Text("Bet Rate:",style: GoogleFonts.alike(
                  fontSize: 15,
                  color: Colors.black26,
                 
                  )),
               ),
               Text("1.6",style: GoogleFonts.alike(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                ))
                      ],
                    ),
 
               
                  ],
                ),
                Container(
                  height: height*0.02,
                  width: width*0.003,
                  color:Colors.teal,
                ),
                 Column(
                  children: [
                    Row(
                      children: [
               Text("Bet Rate:",style: GoogleFonts.alike(
                fontSize: 15,
                color: Colors.black26,
               
                )),
               Padding(
                padding:  EdgeInsets.only(right: width*0.04),
                 child: Text("1.6",style: GoogleFonts.alike(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  )),
               )
                      ],
                    ),
  
               
                  ],
                ),
              ],
             ),
              Text("Admin charge 7% from frofit amount",style: GoogleFonts.alike(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.w300,
                )),
              SizedBox(
                  width: width,
                  height: height*0.04,
                  child: ElevatedButton(onPressed: (){
  showMaterialModalBottomSheet(
                                             context: context,
                                             builder: (context) => Container(
                                               height: height*0.3,
                                               width: width*0.9,
                                               color: Colors.black,
                                               child: Column(
                                                 children: [
                                                  SizedBox(height: height*0.03,),
                                                  Text("Entre your ammount",style: GoogleFonts.lato(color: Colors.white),),
                                                 Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Container(
                                               
                                                    color: Colors.white,
                                                   width: width*4,
                                                   height: height*0.04,
                                                     child: TextField(
                                                       decoration: InputDecoration(
                                                        hintText: "input ammount"
                                                       ),                                   
                                                     ),
                                                   ),
                                                 ),
                                      Text("Potential wingings \$50.9",style: GoogleFonts.lato(color: Colors.white),),

  ElevatedButton(onPressed: (){}, child: Text("Submit and play")),
                                                   Text("Thank you for Playing games" ,style: GoogleFonts.ebGaramond(color: Colors.white,fontWeight: FontWeight.bold,fontSize:height*0.04),)


                                                 ],
                                               ),
                                             ),
                                           );
                                        


                  }, child: Text("Want to bet")))
             ],
          ),
          )
                                    );
                                  }):Center(child: CircularProgressIndicator(),);
                            }
                          )),
                    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     
    
    
        );
  }
}