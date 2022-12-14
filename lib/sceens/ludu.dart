import 'package:beting_app/Helper/fbase.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Helper/style.dart';
import '../models/gamemodel.dart';
import '../widget/beting_card.dart';

class LuduScreen extends StatelessWidget {
      LuduScreen({super.key});
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
                                      child: BetingCard(
                                        height: height,
                                        width: width*.8,
                                        matchName: "${game.name}", image: "https://e7.pngegg.com/pngimages/673/759/png-clipart-dicedice-israel-yahtzee-naija-ludo-android-game-logo-thumbnail.png",
                                         winngPrize: "${game.winingPrize} BDT",
                                         entryFee: "${game.entryFee} BDT",
                                         matchType: "${game.slotonecapacity} vs ${game.slottwocapacity}",
                                         matchStart: "${game.start}",
                                         matchEnd: "${game.end}",
                                         bordType: "${game.boardType}",
                                         joinButtun: (){
                                           showMaterialModalBottomSheet(
                                             context: context,
                                             builder: (context) => Container(
                                               height: height*0.7,
                                               width: width*0.9,
                                               color: Colors.black,
                                               child: Column(
                                                 children: [
                                                   Padding(
                                                     padding: const EdgeInsets.all(8.0),
                                                     child: Text("Wellcome to join this table",style: GoogleFonts.mPlus1(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w700),),),
                                                   Padding(
                                                     padding: const EdgeInsets.all(8.0),
                                                     child: Text("Your joining ID number is : 9uu39rdh8hrhr82hhh8hrh",style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold),),

                                                   ),
                                                   Padding(
                                                     padding: const EdgeInsets.all(8.0),
                                                     child: Text("After win Take a screen Sort  go to profile and tap the button which nme screen sort.After press it you submit your screen sort our team will response soon, you must get your prize money"
                                                       ,style: GoogleFonts.ebGaramond(color: Colors.white,fontWeight: FontWeight.bold),),
                                                   ),
                                                   SizedBox(height: height*0.3,),



                                                   Text("Thank you for Playing games" ,style: GoogleFonts.ebGaramond(color: Colors.white,fontWeight: FontWeight.bold,fontSize:height*0.04),)


                                                 ],
                                               ),
                                             ),
                                           );
                                         })
                                    );
                                  }):Center(child: CircularProgressIndicator(),);
                            }
                          )),
                    















 

    
        );
  }
}