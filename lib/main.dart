import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.yellow,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Conversion Power Watt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  final inputan = TextEditingController();
  List<String> listViewItem = List<String>();
  String _newValue1 = "Watt";
  String _newValue2 = "Megawatt";
  var listItem1 = ["Watt", "Megawatt", "Kilowatt"];
  var listItem2 = ["Watt", "Megawatt", "Kilowatt"];
  double _hasil = 0;
  double _input = 0;

  void perhitunganPower() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    
      body: ListView(
        children: <Widget>[

          Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                Stack(
                  children: [
                      Container(
                        height: 10,
                        )  
                ],),

                  Text("Dari : "),
                    DropdownButton<String>(
                    items: listItem1.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _newValue1,
                    onChanged: (String changeValue) {
                      setState(() {
                        _newValue1 = changeValue;
                      });
                    },
                  ),

                  Text("      Ke : "),
                  DropdownButton<String>(
                    items: listItem2.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _newValue2,
                    onChanged: (String changeValue) {
                      setState(() {
                        _newValue2 = changeValue;
                      });
                    },
                  ),
                ],
              ),

              Stack(
               children: [
                 
                  Container(
                   margin: EdgeInsets.only(top: 20),
                   padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                      // padding: EdgeInsets.only(left: 20.0, bottom: 15.0),
                      child: Text(
                         "Inputkan Nominal : ", style: TextStyle(fontSize: 14, color: Colors.black),
                       ),
                     )  
                ],),

               TextFormField(
                  maxLength: 5,
                  controller: inputan,
                  decoration: InputDecoration(
                    hintText: "",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9+\,]'))
                  ],
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),

                Stack(
                  children: [
                      Container(
                        alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Result : ", style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        )  
                ],),

               TextFormField(
                  controller: inputan,
                  decoration: InputDecoration(
                    hintText: "",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9+\,]'))
                  ],
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),    

                Stack(
                  children: [
                      Container(
                        height: 10,
                        )  
                ],),
                
                SizedBox(
                  width: 200,
                  child:RaisedButton(
                    color: Colors.yellow,
                    padding: EdgeInsets.all(10),
                    onPressed: perhitunganPower,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Convert Power',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )
                  ),
                ),
              ],
           ),

        ],
      ),
    );
  }
}
