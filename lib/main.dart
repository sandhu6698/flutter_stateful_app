import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(title: "Stateful Application", home: favouriteCity());
  }
}

class favouriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _favouriteCity();
  }
}

class _favouriteCity extends State<favouriteCity> {
  String nameCity = "";
  var Cities =["Ludhiana", "New Delhi", "Chandigarh","Mohali","Dharamshala"];

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(
            "Stateful Widget",
            style: TextStyle(color: Colors.greenAccent),
          ),
          backgroundColor: Colors.pinkAccent),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (String userinput) {
                    setState(() {
                      nameCity = userinput;
                    });
                  },
                  cursorRadius: Radius.circular(5.0),
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  decoration: new InputDecoration.collapsed(
                    hintText: "Enter City Here",
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Or Select from the list below", style: TextStyle(color: Colors.white),),
            ),

            DropdownButton<String>(
              items: Cities.map((String dropdownlistitem){
                return DropdownMenuItem<String>(
                  value: dropdownlistitem,
                  child: Text(dropdownlistitem),

                );
              }).toList(),
              onChanged: (String selectedvalue){
                setState(() {
                  nameCity=selectedvalue;

                });
              }

              ,
              value: nameCity,
              style: TextStyle(color: Colors.white , backgroundColor: Colors.black),
            ),
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "The City is $nameCity",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),

          ],
        ),
      ),
    );
  }
}
