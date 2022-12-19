import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/dataController.dart';

class HeaderWidget extends StatefulWidget {
  

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city="";
  var date=DateFormat("yMMMMd" ).format(DateTime.now());
    final DataController controller =Get.put(DataController(),permanent: true);

@override
  void initState() {
    getAddress(controller.getLatitude().value, controller.getLongitude().value);
    super.initState();
  }
  getAddress(lat,lon)async{
    List<Placemark>placemark =await placemarkFromCoordinates(lat, lon);
    Placemark place=placemark[0];
    setState(() {
      city=place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 15),
          child: Text(city,style: TextStyle(fontSize: 35,height: 2),),
        ),
         Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 16,bottom: 20,),
          child: Text(date,style: TextStyle(fontSize: 15,color: Colors.grey[700],height: 1),),
        )
      ],
    );
    
  }
}