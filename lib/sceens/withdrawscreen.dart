
import 'package:beting_app/Helper/fbase.dart';
import 'package:beting_app/Helper/style.dart';
import 'package:beting_app/models/profilemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Helper/fbase.dart';
import '../Helper/fbase.dart';
import '../models/withdrawmodel.dart';



class WithDrawRequest extends StatefulWidget {
  WithDrawRequest({Key? key,}) : super(key: key);
  //ProfileModel? profileModel;

  @override
  State<WithDrawRequest> createState() => _WithDrawRequestState();
}

class _WithDrawRequestState extends State<WithDrawRequest> {
  TextEditingController number = TextEditingController();
  TextEditingController amount = TextEditingController();
  bool canWithdraw = false;
  bool result = false;
  bool processing = false;
  FireBase fireBase = FireBase();
  ProfileModel profileModel=ProfileModel();


  @override
  void initState() {
    // TODO: implement initState
    //print(widget.modelUser.lastWithdraw);
    //print(DateTime.now().difference(widget.modelUser.lastWithdraw!).inDays);
    fireBase.myProfile().then((value) {
      setState(() {
        profileModel=value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Style.backgroundColor3,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Withdraw", style: GoogleFonts.oleoScript(
              color: Colors.white)),
          bottom:  TabBar(tabs: [
            Tab(
              child: SvgPicture.asset("assets/bkash.svg"),
            ),
            Tab(
              child: SvgPicture.asset("assets/nogod.svg")
            ),
            Tab(
              child: SvgPicture.asset("assets/roket.svg")
            ),
            Tab(
              child: SvgPicture.asset("assets/binance.svg")
            ),
          ]),
        ),
        body: /*widget.profileModel!.lastWithdraw == null ||
            DateTime.now().difference(widget.modelUser!.lastWithdraw!).inDays >
                30
            ? */Padding(
            padding: const EdgeInsets.all(8.0),
            child:TabBarView(children: [
              Container(
                decoration: BoxDecoration(
                    color: Style.backgroundColor3,
                    borderRadius: BorderRadius.circular(5)),

                child: Column(
                  children: [
                    Text("Your current balance: ${profileModel.totalBalance}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: number,
              style: const TextStyle(color: Colors.black),
                            decoration:  InputDecoration(
                                border: InputBorder.none,
                                hintText: "Press B and enter your bkash number",
                                helperText: "B+018809654",
                                helperStyle: GoogleFonts.lato(color: Colors.black),
                                hintStyle: GoogleFonts.lato(color: Colors.black)
                            ),

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(  decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          onChanged: (v) {
                            double k = double.parse(v);
                            if (k <= profileModel.totalBalance!) {
                              setState(() {
                                canWithdraw = true;
                              });
                            } else {
                              setState(() {
                                canWithdraw = false;
                              });
                            }
                          },
                      
                          controller: amount,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            
                            hintText: "Amount you want to withdraw",
                             hintStyle: GoogleFonts.lato(color: Colors.black)
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: canWithdraw,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              processing = true;
                            });
                            fireBase
                                .withdrawRequest(WithdrawModel(
                                uid: profileModel.uid,
                                amount: double.parse(amount.text.trim()),
                                number: number.text.trim()))
                                .then((value) {
                              setState(() {
                                result = value;
                              });
                            });
                            //fireBase.addLastWithdraw();
                            fireBase.myProfile().then((value) {
                              setState(() {
                                profileModel = value;
                              });
                            });
                          },
                          child: const Text("Withdraw")),
                    ),
                    Visibility(
                      visible: processing,
                      child: result
                          ? const Text("Your request is received, wait for the approval")
                          : const Text("Processing request"),
                    )
                  ],
                ),


              ),
              Container(
                decoration: BoxDecoration(
                   color: Style.backgroundColor3,
                    borderRadius: BorderRadius.circular(5)),
                child:  Column(
                  children: [
                    Text("Your current balance: ${profileModel.totalBalance}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),

                        child: TextField(
                          controller: number,


                           style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Press R and enter your Rocket number",
                              helperText: "R+018809654",
                               helperStyle: GoogleFonts.lato(color: Colors.black),
                                hintStyle: GoogleFonts.lato(color: Colors.black)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(  decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                        child: TextField(
                          onChanged: (v) {
                            double k = double.parse(v);
                            if (k <= profileModel.totalBalance!) {
                              setState(() {
                                canWithdraw = true;
                              });
                            } else {
                              setState(() {
                                canWithdraw = false;
                              });
                            }
                          },
                           style: TextStyle(color: Colors.black),
                          controller: amount,
                          keyboardType: TextInputType.number,
                          decoration:  InputDecoration(
                            hintText: "Amount you want to withdraw",
                            hintStyle: GoogleFonts.lato(color: Colors.black)
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: canWithdraw,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              processing = true;
                            });
                            fireBase
                                .withdrawRequest(WithdrawModel(
                                uid: profileModel.uid,
                                amount: double.parse(amount.text.trim()),
                                number: number.text.trim()))
                                .then((value) {
                              setState(() {
                                result = value;
                              });
                            });
                            //fireBase.addLastWithdraw();
                            fireBase.myProfile().then((value) {
                              setState(() {
                                profileModel = value;
                              });
                            });
                          },
                          child: const Text("Withdraw")),
                    ),
                    Visibility(
                      visible: processing,
                      child: result
                          ? const Text("Your request is received, wait for the approval")
                          : const Text("Processing request"),
                    )
                  ],
                ),

              ),
              Container(
                decoration: BoxDecoration(
                    color: Style.backgroundColor3,
                    borderRadius: BorderRadius.circular(5)),
                child:  Column(
                  children: [
                    Text("Your current balance: ${profileModel.totalBalance}",
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),

                        child: TextField(
                          controller: number,
                         style: const TextStyle(color: Colors.black),
                          decoration:  InputDecoration(
                              border: InputBorder.none,
                              hintText: "Press N and enter your Nogod number",
                              helperText: "N+018809654",
                              hintStyle: GoogleFonts.lato(color: Colors.black),
                              helperStyle: GoogleFonts.lato(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(  decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                        child: TextField(
                          onChanged: (v) {
                            double k = double.parse(v);
                            if (k <= profileModel.totalBalance!) {
                              setState(() {
                                canWithdraw = true;
                              });
                            } else {
                              setState(() {
                                canWithdraw = false;
                              });
                            }
                          },
                           style: TextStyle(color: Colors.black),
                          controller: amount,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                             helperStyle: GoogleFonts.lato(color: Colors.black),
                                hintStyle: GoogleFonts.lato(color: Colors.black),
                            hintText: "Amount you want to withdraw",
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: canWithdraw,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              processing = true;
                            });
                            fireBase
                                .withdrawRequest(WithdrawModel(
                                uid: profileModel.uid,
                                amount: double.parse(amount.text.trim()),
                                number: number.text.trim()))
                                .then((value) {
                              setState(() {
                                result = value;
                              });
                            });
                            //fireBase.addLastWithdraw();
                            fireBase.myProfile().then((value) {
                              setState(() {
                               profileModel = value;
                              });
                            });
                          },
                          child: const Text("Withdraw")),
                    ),
                    Visibility(
                      visible: processing,
                      child: result
                          ? const Text("Your request is received, wait for the approval")
                          : const Text("Processing request"),
                    )
                  ],
                ),

              ),
              Container(
                decoration: BoxDecoration(
                    color: Style.backgroundColor3,
                    borderRadius: BorderRadius.circular(5)),
                child:  Column(
                  children: [
                    Text("Your current balance: ${profileModel.totalBalance}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),

                        child: TextField(
                           style: const TextStyle(color: Colors.black),
                          controller: number,
                          keyboardType: TextInputType.phone,
                          decoration:  InputDecoration(
                            hintText: "Binance",
                            helperStyle: GoogleFonts.lato(color: Colors.black),
                                hintStyle: GoogleFonts.lato(color: Colors.black)
                             ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container( 
                         decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                        child: TextField(
                          onChanged: (v) {
                            double k = double.parse(v);
                            if (k <= profileModel.totalBalance!) {
                              setState(() {
                                canWithdraw = true;
                              });
                            } else {
                              setState(() {
                                canWithdraw = false;
                              });
                            }
                          },
                           style: const TextStyle(color: Colors.black),
                          controller: amount,
                          keyboardType: TextInputType.number,
                          decoration:  InputDecoration(
                             helperStyle: GoogleFonts.lato(color: Colors.black),
                                hintStyle: GoogleFonts.lato(color: Colors.black),
                            hintText: "Amount you want to withdraw",
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: canWithdraw,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              processing = true;
                            });
                            fireBase
                                .withdrawRequest(WithdrawModel(
                                uid: profileModel.uid,
                                amount: double.parse(amount.text.trim()),
                                number: number.text.trim()))
                                .then((value) {
                              setState(() {
                                result = value;
                              });
                            });
                            //fireBase.addLastWithdraw();
                            fireBase.myProfile().then((value) {
                              setState(() {
                                profileModel = value;
                              });
                            });
                          },
                          child: const Text("Withdraw")),
                    ),
                    Visibility(
                      visible: processing,
                      child: result
                          ? const Text("Your request is received, wait for the approval")
                          : const Text("Processing request"),
                    )
                  ],
                ),

              )
            ]))
            /*: const Center(
          child: Text("Cant withdraw now"),
        ),*/
      ),
    );
  }

  //static FireBase() {}
}