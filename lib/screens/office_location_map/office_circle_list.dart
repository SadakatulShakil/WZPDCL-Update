import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';

import 'package:wzpdcl_app_flutter/components/location.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/Faq.dart';
import 'package:wzpdcl_app_flutter/models/complaint/Complaint.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';


class OfficeCircleList extends StatefulWidget {
  @override
  _OfficeCircleListState createState() => _OfficeCircleListState();

  OfficeCircleList() : super(key: GlobalKey());
}

class _OfficeCircleListState extends State<OfficeCircleList> {
  ScrollController scrollController = ScrollController();
  int showSub = -1;
  int showMap = -1;

  bool isEn = true;

  @override
  void initState() {
    getLocationData().whenComplete((){
      setState(() {});
    });
    super.initState();
  }

  getLocationData() async{
    Location loc = Location();
    await loc.getCurrentLocation();
    longitude = loc.longitude;
    latitude = loc.latitude;
    _center = loc.center;
    print(latitude);
    print(longitude);
  }

  @override
  Widget build(BuildContext context) {
    isEn = CommonOperation.isEn(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonOperation.commonAppbar(),
        body: SafeArea(
          child: body(),
        ));
  }

  body() {
    return Container(
      // height: ScreenRF.height(context) - 150,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset:
                  Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Text(Languages.of(context)!.OfficeLocationMap,
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.indigo.shade500),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
              child: SingleChildScrollView(
            controller: scrollController,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              key: GlobalKey(),
              children: [
               Container(width: ScreenRF.width(context), child: list())
              ],
            ),
          )),
        ],
      ),
    );
  }

  list() {
    return ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            child:Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(10),
              width: ScreenRF.width(context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.white70],
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(0, 1),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.all(Radius.circular(2)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.4)),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  Stack(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         // Text((index+1).toString()+"."),
                          SizedBox(width: 5,),
                          Text(isEn?"Khulna Circle":"খুলনা সার্কেল",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),),
                  //  Align(alignment: Alignment.centerRight,child: Image.asset('assets/images/pdf.png',height: 30,width: 30,),)
                    Align(alignment: Alignment.centerRight,
                        child: index == showSub? Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.black,
                      size: 24.0,
                     /// semanticLabel: 'Text to announce in accessibility modes',
                    ): Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                          size: 24.0,
                          /// semanticLabel: 'Text to announce in accessibility modes',
                        ) ),

                    Align(alignment: Alignment.bottomLeft,
                      child: index == showSub? Row(children: [Expanded(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              key: GlobalKey(),
                              children: [
                                SizedBox(height: 30,),
                                Container(width: ScreenRF.width(context), child: list2())
                              ],
                            ),
                          ))],)
                    : Container(),)

                  ],),


                ],
              ),
            ) ,
            onTap: () {
              if(showSub == index){
                showSub = -1;
                showMap = -1;
              }else{
                showSub = index;
                showMap = -1;
              }

              setState(() {

              });
             /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      CommonOperation.pdfView("http://www.africau.edu/images/default/sample.pdf")
                  ));*/

            }
          );

        });
  }

  list2() {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
              child:Container(
                margin: const EdgeInsets.only(left: 10, right: 20, top: 0, bottom: 0),
                padding: const EdgeInsets.all(5),
                width: ScreenRF.width(context),
                /*decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white70],
                      begin: FractionalOffset(0, 0),
                      end: FractionalOffset(0, 1),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.4)),
                  ],
                ),*/
                child: Column(
                  children: [

                    SizedBox(height: 5,),
                    Stack(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Text((index+1).toString()+"."),
                            SizedBox(width: 5,),
                            Text(isEn?"Barguna ESU":"বরগুনা ইএসইউ",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),),
                      //  Align(alignment: Alignment.centerRight,child: Image.asset('assets/images/pdf.png',height: 30,width: 30,),)
                      Align(alignment: Alignment.centerRight,child: index == showMap? Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.black,
                        size: 24.0,
                        /// semanticLabel: 'Text to announce in accessibility modes',
                      ): Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                        size: 24.0,
                        /// semanticLabel: 'Text to announce in accessibility modes',
                      ) ),

                      Align(
                        alignment: Alignment.bottomLeft,
                        child: index == showMap? Row(children: [Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                key: GlobalKey(),
                                children: [
                                  SizedBox(height: 30,),
                                  Container(width: ScreenRF.width(context),
                                      child: addressAndMap())
                                ],
                              ),
                            ))],)
                        : Container(),)


                    ],)
                  ],
                ),
              ) ,
              onTap: () {
                if(showMap == index){
                  showMap = -1;
                }else{
                  showMap = index;
                }

                setState(() {

                });
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CommonOperation.pdfView("http://www.africau.edu/images/default/sample.pdf")
                    ));*/

              }
          );

        });
  }

  addressAndMap(){
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(8),
      width: ScreenRF.width(context),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.white70],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(0, 1),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 5,
              color: Colors.black.withOpacity(0.4)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GapRF(10),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Languages.of(context)!.Address,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14)),
                    GapRF(5),
                    Text(Languages.of(context)!.OfficePhone,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14)),
                    GapRF(5),
                    Text(Languages.of(context)!.OfficeEmail,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14)),
                    GapRF(5),
                    Text(Languages.of(context)!.Website,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14)),

                  ],
                ),
              ),
              GapRF(15),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(":  " + "Rd no -16, Town...",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    GapRF(5),
                    Text(":  " + "016704978",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    GapRF(5),
                    Text(":  " + "xyz@wzpdcl.gov.com",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    GapRF(5),
                    Text(":  " + "wzpdcl.gov.com",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              )
            ],
          ),
          GapRF(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GapRF(5),
              Column(
                children: [

                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white),
                    ),
                    onPressed: () {},
                    child: Image.asset('assets/images/call.png',height: 30,width: 30,),
                  )
                ],
              ),
              GapRF(50),
              Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {},
                    child: Image.asset('assets/images/mail.png',height: 28,width: 28,),
                  )
                ],
              )
            ],
          ),
          Container(
              height: 150,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                markers: _createMarker(),
                initialCameraPosition:CameraPosition(target: _center, zoom: 10.0) ,
                onMapCreated: _onMapCreated,)
          ),
        ],
      ),
    );

  }


  Completer<GoogleMapController> _controller = Completer();
  String? address;
  late double latitude;
  late double longitude;
  late LatLng _center;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
        draggable: true,
        onDragEnd: (LatLng){
          print(LatLng);
          getAddress(LatLng);
        },
        markerId: MarkerId("marker_1"),
        position: _center,
        infoWindow: InfoWindow(title: 'Marker 1'),
      ),
    };
  }
  void getAddress(LatLng loc) async{
    var lon = loc.longitude;
    var lat = loc.latitude;
    final coordinates = new Coordinates(lat, lon);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    address = first.addressLine;
    print(address);
  }

}
