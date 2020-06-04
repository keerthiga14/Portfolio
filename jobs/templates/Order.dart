import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/Constants.dart';
import 'package:intl/intl.dart';
import 'SuccessPage.dart';
import 'dart:async';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String dropdownValue = 'CS5223';
  String userid='112233';
  String phonenumber = '123456789';
  String name = 'Vishnuvarshan P';
  String quantity = '2 litres';
  String date = '27/05/2020';
  String enddate='27/06/2020';
  String timing='Morning';

  DateTime selectedDate = DateTime.now();
  var formatter =  DateFormat('dd-MM-yyyy');
  DateTime fromDate =
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime toDate =
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);


  Future<DateTime> selectDate(BuildContext context, DateTime _date) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      _date = picked;
    }
    return _date;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height:5),
                Center(
                  child: Container(
                    child: Text(
                      'ORDER',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
               SizedBox(
                //  color: Colors.blue,
                  height: 20,
//                  thickness: 1,
                ),

                SizedBox(
                  height:15,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'QUANTITY',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            child: Text(
                              ':',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 20,
                          ),
                          DropdownButton<String>(
                            value: quantity,
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                quantity = newValue;
                              });
                            },
                            items: <String>[
                              '1 litre',
                              '2 litres',
                              '3 litres',
                              '4 litres',
                              '5 litres',
                              '6 litres',
                              '7 litres',
                              '8 litres'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                  fontSize: 17,
                                ),),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'FROM',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 62,
                          ),
                          Container(
                            child: Text(
                              ':',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 3,
                          ),

                        //  SizedBox(height: 20.0,),
                          FlatButton(
                            onPressed: () async {
                              fromDate = await selectDate(context, fromDate);
                              setState(() {});
                            },

                            child:Padding(
                              padding: const EdgeInsets.only(right:70),
                              child: Row(
                                children: <Widget>[
                                  Text('${formatter.format(fromDate)}', style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                    fontSize: 17,
                                  ),),
                                  Icon(Icons.keyboard_arrow_down),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'TO',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 91,
                          ),
                          Container(

                            child: Text(
                              ':',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          SizedBox(
                            width:3,
                          ),
//                          Text("${selectedDate.toLocal()}".split(' ')[0], style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                            color: Colors.purple,
//                            fontSize: 17,
//                          ),),
                          //  SizedBox(height: 20.0,),
                          FlatButton(
                            onPressed: () async {
                              toDate = await selectDate(context, toDate);
                              setState(() {});
                            },
                            child:Padding(
                              padding: const EdgeInsets.only(right:70),

                              child: Row(
                                children: <Widget>[
                              Text('${formatter.format(toDate)}', style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                    fontSize: 17,
                                  ),),
                                  Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'TIMING',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            width: 48,
                          ),
                          Container(
                            child: Text(
                              ':',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          DropdownButton<String>(
                            value: timing,
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                timing = newValue;
                              });
                            },
                            items: <String>['Morning','Evening','Both']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                  fontSize: 17,
                                ),),
                              );
                            }).toList(),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'AMOUNT',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:5,
                                ),
                                Container(
                                  child:Text('All charges included *',style:TextStyle(
                                    fontSize: 10,
                                  ),),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            width: 21,
                          ),
                          Container(
                            child: Text(
                              ':',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Container(

                              child:Text(
                                '₹ 50.00 ',
                                style: TextStyle(
                                  fontSize: 25,
                                  color:Colors.purple,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                 height:20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(right:4),
                              child: Text(
                                'PASSWORD',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 8,
                          ),
                          Container(

                            child: Text(
                              ':',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 17,
                          ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right:20),
                            child: TextField(
                                obscureText: true,

                                onChanged: (value) {

                                },
                                decoration:
                                 InputDecoration(
                                  hintText: 'Enter password',
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                   enabledBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),

                                   ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),

                                  ),
                                ),
                              ),
                          ),
                        ),
                        ],
                      ),
                    ],
                  ),
                ),
              SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 50.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.blue.shade300,
                      color: Colors.blue,
                      elevation: 7.0,

                      child: FlatButton(
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // return object of type Dialog
                              return AlertDialog(
                                title:  Center(child: Text("CONFIRM ORDER",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),)),
                                content:  Text("Please confirm to order your milk !"),
                                actions: <Widget>[
                                  // usually buttons at the bottom of the dialog
                                  Row(

                                    children: <Widget>[
                                      FlatButton(
                                        child:  Text("CONFIRM"),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => SuccessPage()),

                                          );
                                        },
                                      ),
                                       FlatButton(
                                        child:  Text("CANCEL"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            'Order Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
