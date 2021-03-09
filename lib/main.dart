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
  final inputController = TextEditingController();
  List<String> listViewItem = List<String>();
  String _newValue1 = "Watt";
  String _newValue2 = "Megawatt";
  var listItem1 = ["Watt", "Megawatt", "Kilowatt"];
  var listItem2 = ["Watt", "Megawatt", "Kilowatt"];

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

      body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [

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
    
                TextFormField(
                  maxLength: 5,
                  controller: inputController,
                  decoration: InputDecoration(
                    hintText: "Inputkan Nominal Power",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9+\,]'))
                  ],
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),

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
               
               RaisedButton(
                  color: Colors.yellow,
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
              ],
            ),
      ),
    );
  }
}
