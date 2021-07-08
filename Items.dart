import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/controller/itemcontroller.dart';

class Item extends StatelessWidget {
  final itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itemController.listOfOitem.length,
              itemBuilder: (context, index) {
                return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width / 1.2,
                    padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(23),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            spreadRadius: 9,
                            offset: Offset(1, 4),
                            blurRadius: 7,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 150,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.greenAccent,
                                    /*    foregroundImage: AssetImage(itemController
                                          .listOfOitem[index].image), */
                                  )
                                ],
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      itemController.listOfOitem[index].name,
                                      style: GoogleFonts.lora(fontSize: 22),
                                    ),
                                    Text(
                                      itemController.listOfOitem[index].title,
                                      maxLines: 4,
                                      style: GoogleFonts.lora(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    itemController.listOfOitem[index].price,
                                    style: GoogleFonts.lora(fontSize: 22),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  itemController.changeQuantityAdd(
                                      itemController.listOfOitem[index]);
                                },
                                child: Icon(Icons.add)),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() {
                              return Text(
                                itemController.listOfOitem[index].quantity
                                    .toString(),
                                style: GoogleFonts.lora(fontSize: 22),
                              );
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  itemController.changeQuantityRemove(
                                      itemController.listOfOitem[index]);
                                },
                                child: Icon(Icons.remove)),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Obx(() {
                                return InkWell(
                                  onTap: () {
                                    itemController.isAddedButton();
                                  },
                                  child: Text(
                                    itemController.isAdded.value
                                        ? "Remove from cart"
                                        : "Add to cart",
                                    style: GoogleFonts.lora(fontSize: 13),
                                  ),
                                );
                              }),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              decoration: BoxDecoration(
                                  color: Colors.orange[800],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15))),
                            )
                          ],
                        )
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
      /*   : Center(child: CircularProgressIndicator()); */
    );
  }
}
